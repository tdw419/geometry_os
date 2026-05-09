; DESCRIPTION: Renders a green disk with center (212, 129) and radius 13.
; PLAN: r0=212(x), r1=129(y), r2=13(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 129
LDI r2, 13
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
