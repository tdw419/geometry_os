; DESCRIPTION: Renders a yellow disk with center (339, 229) and radius 20.
; PLAN: r0=339(x), r1=229(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 229
LDI r2, 20
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
