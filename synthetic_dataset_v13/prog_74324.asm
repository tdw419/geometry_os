; DESCRIPTION: Creates a blue rectangular region at (4, 81) spanning 51 by 12 pixels.
; PLAN: r0=4(x), r1=81(y), r2=51(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 81
LDI r2, 51
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
