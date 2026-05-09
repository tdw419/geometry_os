; DESCRIPTION: Renders a blue disk with center (141, 129) and radius 42.
; PLAN: r0=141(x), r1=129(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 129
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
