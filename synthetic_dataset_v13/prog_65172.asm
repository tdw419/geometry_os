; DESCRIPTION: Draws a magenta rectangle at (45, 36) with width 37 and height 25.
; PLAN: r0=45(x), r1=36(y), r2=37(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 36
LDI r2, 37
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
