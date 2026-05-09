; DESCRIPTION: Draws a green rectangle at (147, 127) with width 67 and height 85.
; PLAN: r0=147(x), r1=127(y), r2=67(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 127
LDI r2, 67
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
