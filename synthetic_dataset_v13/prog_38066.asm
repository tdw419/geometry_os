; DESCRIPTION: Renders a yellow disk with center (448, 54) and radius 27.
; PLAN: r0=448(x), r1=54(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 448
LDI r1, 54
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
