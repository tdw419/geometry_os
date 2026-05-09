; DESCRIPTION: Draws a magenta rectangle at (260, 67) with width 12 and height 80.
; PLAN: r0=260(x), r1=67(y), r2=12(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 67
LDI r2, 12
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
