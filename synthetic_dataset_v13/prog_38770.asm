; DESCRIPTION: Renders a red disk with center (463, 129) and radius 12.
; PLAN: r0=463(x), r1=129(y), r2=12(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 463
LDI r1, 129
LDI r2, 12
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
