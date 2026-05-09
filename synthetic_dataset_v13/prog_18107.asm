; DESCRIPTION: Places a magenta circle of radius 64 at center (350, 166).
; PLAN: r0=350(x), r1=166(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 166
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
