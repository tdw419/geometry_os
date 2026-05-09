; DESCRIPTION: Draws a magenta circle centered at (242, 188) with radius 64.
; PLAN: r0=242(x), r1=188(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 242
LDI r1, 188
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
