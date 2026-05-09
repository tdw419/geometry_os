; DESCRIPTION: Renders a white disk with center (404, 129) and radius 54.
; PLAN: r0=404(x), r1=129(y), r2=54(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 129
LDI r2, 54
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
