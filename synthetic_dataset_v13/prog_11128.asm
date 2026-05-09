; DESCRIPTION: Renders a yellow disk with center (391, 129) and radius 66.
; PLAN: r0=391(x), r1=129(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 391
LDI r1, 129
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
