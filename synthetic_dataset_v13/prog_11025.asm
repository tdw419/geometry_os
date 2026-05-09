; DESCRIPTION: Draws a magenta rectangle at (257, 7) with width 27 and height 111.
; PLAN: r0=257(x), r1=7(y), r2=27(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 7
LDI r2, 27
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
