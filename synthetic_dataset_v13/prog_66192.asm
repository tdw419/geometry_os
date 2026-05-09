; DESCRIPTION: Creates a purple rectangular region at (372, 41) spanning 81 by 31 pixels.
; PLAN: r0=372(x), r1=41(y), r2=81(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 41
LDI r2, 81
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
