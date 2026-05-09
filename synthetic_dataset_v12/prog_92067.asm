; DESCRIPTION: Places a magenta circle of radius 79 at center (206, 120).
; PLAN: r0=206(x), r1=120(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 120
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
