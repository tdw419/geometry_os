; DESCRIPTION: Renders a blue disk with center (123, 65) and radius 65.
; PLAN: r0=123(x), r1=65(y), r2=65(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 65
LDI r2, 65
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
