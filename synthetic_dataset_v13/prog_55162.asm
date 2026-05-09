; DESCRIPTION: Draws a magenta rectangle at (361, 99) with width 23 and height 72.
; PLAN: r0=361(x), r1=99(y), r2=23(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 99
LDI r2, 23
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
