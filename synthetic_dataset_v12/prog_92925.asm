; DESCRIPTION: Renders a purple disk with center (361, 58) and radius 50.
; PLAN: r0=361(x), r1=58(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 58
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
