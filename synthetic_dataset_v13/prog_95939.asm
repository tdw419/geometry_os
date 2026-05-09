; DESCRIPTION: Draws a magenta circle centered at (281, 107) with radius 28.
; PLAN: r0=281(x), r1=107(y), r2=28(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 281
LDI r1, 107
LDI r2, 28
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
