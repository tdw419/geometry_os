; DESCRIPTION: Draws a magenta rectangle at (131, 2) with width 39 and height 65.
; PLAN: r0=131(x), r1=2(y), r2=39(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 2
LDI r2, 39
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
