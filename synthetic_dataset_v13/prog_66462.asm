; DESCRIPTION: Places a magenta circle of radius 16 at center (147, 175).
; PLAN: r0=147(x), r1=175(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 175
LDI r2, 16
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
