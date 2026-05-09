; DESCRIPTION: Renders a blue disk with center (277, 129) and radius 68.
; PLAN: r0=277(x), r1=129(y), r2=68(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 277
LDI r1, 129
LDI r2, 68
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
