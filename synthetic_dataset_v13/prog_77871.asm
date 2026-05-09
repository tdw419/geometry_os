; DESCRIPTION: Places a magenta circle of radius 36 at center (77, 86).
; PLAN: r0=77(x), r1=86(y), r2=36(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 86
LDI r2, 36
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
