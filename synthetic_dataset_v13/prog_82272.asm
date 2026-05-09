; DESCRIPTION: Renders a green disk with center (204, 129) and radius 27.
; PLAN: r0=204(x), r1=129(y), r2=27(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 129
LDI r2, 27
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
