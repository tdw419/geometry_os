; DESCRIPTION: Places a magenta circle of radius 20 at center (87, 221).
; PLAN: r0=87(x), r1=221(y), r2=20(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 221
LDI r2, 20
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
