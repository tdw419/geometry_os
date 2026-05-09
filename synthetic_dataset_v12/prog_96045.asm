; DESCRIPTION: Places a magenta circle of radius 57 at center (135, 120).
; PLAN: r0=135(x), r1=120(y), r2=57(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 120
LDI r2, 57
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
