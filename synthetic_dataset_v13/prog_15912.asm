; DESCRIPTION: Renders a purple disk with center (308, 167) and radius 63.
; PLAN: r0=308(x), r1=167(y), r2=63(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 308
LDI r1, 167
LDI r2, 63
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
