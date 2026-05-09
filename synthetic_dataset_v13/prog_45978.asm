; DESCRIPTION: Renders a blue disk with center (449, 188) and radius 27.
; PLAN: r0=449(x), r1=188(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 449
LDI r1, 188
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
