; DESCRIPTION: Renders a cyan disk with center (312, 129) and radius 71.
; PLAN: r0=312(x), r1=129(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 312
LDI r1, 129
LDI r2, 71
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
