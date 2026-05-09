; DESCRIPTION: Places a magenta circle of radius 51 at center (296, 127).
; PLAN: r0=296(x), r1=127(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 296
LDI r1, 127
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
