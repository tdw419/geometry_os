; DESCRIPTION: Renders a blue disk with center (105, 97) and radius 32.
; PLAN: r0=105(x), r1=97(y), r2=32(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 97
LDI r2, 32
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
