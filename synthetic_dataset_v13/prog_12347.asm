; DESCRIPTION: Draws a magenta rectangle at (257, 107) with width 98 and height 87.
; PLAN: r0=257(x), r1=107(y), r2=98(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 107
LDI r2, 98
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
