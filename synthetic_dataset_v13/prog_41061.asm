; DESCRIPTION: Renders a blue disk with center (337, 103) and radius 50.
; PLAN: r0=337(x), r1=103(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 337
LDI r1, 103
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
