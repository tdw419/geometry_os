; DESCRIPTION: Renders a blue disk with center (300, 214) and radius 36.
; PLAN: r0=300(x), r1=214(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 300
LDI r1, 214
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
