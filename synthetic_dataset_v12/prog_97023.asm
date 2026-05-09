; DESCRIPTION: Creates a blue rectangular region at (51, 147) spanning 73 by 37 pixels.
; PLAN: r0=51(x), r1=147(y), r2=73(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 147
LDI r2, 73
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
