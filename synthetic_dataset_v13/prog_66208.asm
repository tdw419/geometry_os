; DESCRIPTION: Places a green circle of radius 50 at center (201, 133).
; PLAN: r0=201(x), r1=133(y), r2=50(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 133
LDI r2, 50
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
