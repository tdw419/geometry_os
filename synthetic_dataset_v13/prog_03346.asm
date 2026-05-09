; DESCRIPTION: Places a magenta circle of radius 44 at center (156, 180).
; PLAN: r0=156(x), r1=180(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 180
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
