; DESCRIPTION: Renders a green disk with center (218, 129) and radius 49.
; PLAN: r0=218(x), r1=129(y), r2=49(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 129
LDI r2, 49
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
