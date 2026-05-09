; DESCRIPTION: Creates a purple rectangular region at (45, 105) spanning 118 by 77 pixels.
; PLAN: r0=45(x), r1=105(y), r2=118(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 105
LDI r2, 118
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
