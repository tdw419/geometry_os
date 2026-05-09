; DESCRIPTION: Creates a purple rectangular region at (4, 165) spanning 41 by 73 pixels.
; PLAN: r0=4(x), r1=165(y), r2=41(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 165
LDI r2, 41
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
