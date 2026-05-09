; DESCRIPTION: Creates a blue rectangular region at (378, 24) spanning 62 by 51 pixels.
; PLAN: r0=378(x), r1=24(y), r2=62(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 24
LDI r2, 62
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
