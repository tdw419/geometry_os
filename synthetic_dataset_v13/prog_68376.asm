; DESCRIPTION: Draws a magenta rectangle at (369, 46) with width 22 and height 109.
; PLAN: r0=369(x), r1=46(y), r2=22(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 46
LDI r2, 22
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
