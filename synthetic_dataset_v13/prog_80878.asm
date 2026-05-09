; DESCRIPTION: Creates a blue rectangular region at (432, 32) spanning 51 by 118 pixels.
; PLAN: r0=432(x), r1=32(y), r2=51(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 32
LDI r2, 51
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
