; DESCRIPTION: Places a magenta circle of radius 13 at center (260, 120).
; PLAN: r0=260(x), r1=120(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 260
LDI r1, 120
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
