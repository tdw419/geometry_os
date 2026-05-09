; DESCRIPTION: Draws a magenta rectangle at (176, 50) with width 67 and height 27.
; PLAN: r0=176(x), r1=50(y), r2=67(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 50
LDI r2, 67
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
