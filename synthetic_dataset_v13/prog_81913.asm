; DESCRIPTION: Draws a magenta rectangle at (131, 131) with width 21 and height 68.
; PLAN: r0=131(x), r1=131(y), r2=21(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 131
LDI r2, 21
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
