; DESCRIPTION: Draws a magenta circle centered at (126, 182) with radius 68.
; PLAN: r0=126(x), r1=182(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 182
LDI r2, 68
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
