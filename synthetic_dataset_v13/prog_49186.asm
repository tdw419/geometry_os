; DESCRIPTION: Renders a blue disk with center (145, 132) and radius 33.
; PLAN: r0=145(x), r1=132(y), r2=33(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 132
LDI r2, 33
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
