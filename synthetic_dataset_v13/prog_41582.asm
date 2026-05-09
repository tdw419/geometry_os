; DESCRIPTION: Creates a purple rectangular region at (228, 102) spanning 41 by 81 pixels.
; PLAN: r0=228(x), r1=102(y), r2=41(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 102
LDI r2, 41
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
