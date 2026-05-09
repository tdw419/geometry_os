; DESCRIPTION: Renders a yellow disk with center (428, 78) and radius 36.
; PLAN: r0=428(x), r1=78(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 78
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
