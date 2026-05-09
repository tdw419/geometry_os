; DESCRIPTION: Places a magenta circle of radius 18 at center (464, 54).
; PLAN: r0=464(x), r1=54(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 464
LDI r1, 54
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
