; DESCRIPTION: Draws a magenta rectangle at (369, 90) with width 67 and height 48.
; PLAN: r0=369(x), r1=90(y), r2=67(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 90
LDI r2, 67
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
