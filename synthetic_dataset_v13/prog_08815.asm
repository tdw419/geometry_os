; DESCRIPTION: Renders a yellow disk with center (280, 94) and radius 70.
; PLAN: r0=280(x), r1=94(y), r2=70(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 280
LDI r1, 94
LDI r2, 70
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
