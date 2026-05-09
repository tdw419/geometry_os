; DESCRIPTION: Renders a blue disk with center (383, 129) and radius 34.
; PLAN: r0=383(x), r1=129(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 383
LDI r1, 129
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
