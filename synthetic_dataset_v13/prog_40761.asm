; DESCRIPTION: Places a magenta circle of radius 78 at center (180, 95).
; PLAN: r0=180(x), r1=95(y), r2=78(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 95
LDI r2, 78
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
