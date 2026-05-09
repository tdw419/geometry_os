; DESCRIPTION: Places a magenta circle of radius 14 at center (248, 196).
; PLAN: r0=248(x), r1=196(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 248
LDI r1, 196
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
