; DESCRIPTION: Renders a blue disk with center (168, 67) and radius 52.
; PLAN: r0=168(x), r1=67(y), r2=52(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 67
LDI r2, 52
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
