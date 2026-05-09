; DESCRIPTION: Places a magenta circle of radius 77 at center (192, 120).
; PLAN: r0=192(x), r1=120(y), r2=77(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 120
LDI r2, 77
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
