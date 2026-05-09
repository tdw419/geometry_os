; DESCRIPTION: Places a magenta circle of radius 10 at center (218, 44).
; PLAN: r0=218(x), r1=44(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 44
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
