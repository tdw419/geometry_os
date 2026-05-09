; DESCRIPTION: Renders a purple disk with center (200, 129) and radius 59.
; PLAN: r0=200(x), r1=129(y), r2=59(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 129
LDI r2, 59
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
