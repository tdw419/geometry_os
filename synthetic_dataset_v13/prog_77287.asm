; DESCRIPTION: Renders a blue disk with center (228, 129) and radius 25.
; PLAN: r0=228(x), r1=129(y), r2=25(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 228
LDI r1, 129
LDI r2, 25
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
