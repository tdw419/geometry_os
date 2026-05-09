; DESCRIPTION: Renders a yellow disk with center (278, 129) and radius 20.
; PLAN: r0=278(x), r1=129(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 278
LDI r1, 129
LDI r2, 20
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
