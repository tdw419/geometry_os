; DESCRIPTION: Renders a cyan disk with center (194, 129) and radius 23.
; PLAN: r0=194(x), r1=129(y), r2=23(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 129
LDI r2, 23
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
