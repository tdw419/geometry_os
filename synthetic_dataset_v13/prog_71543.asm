; DESCRIPTION: Places a green circle of radius 36 at center (448, 197).
; PLAN: r0=448(x), r1=197(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 448
LDI r1, 197
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
