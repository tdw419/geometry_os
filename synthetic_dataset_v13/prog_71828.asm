; DESCRIPTION: Renders a yellow disk with center (350, 133) and radius 20.
; PLAN: r0=350(x), r1=133(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 133
LDI r2, 20
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
