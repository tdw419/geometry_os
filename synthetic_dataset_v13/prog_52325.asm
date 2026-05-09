; DESCRIPTION: Draws a magenta rectangle at (369, 72) with width 37 and height 21.
; PLAN: r0=369(x), r1=72(y), r2=37(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 72
LDI r2, 37
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
