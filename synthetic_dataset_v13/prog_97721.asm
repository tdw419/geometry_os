; DESCRIPTION: Creates a blue rectangular region at (140, 45) spanning 80 by 51 pixels.
; PLAN: r0=140(x), r1=45(y), r2=80(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 45
LDI r2, 80
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
