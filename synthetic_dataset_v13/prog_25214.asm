; DESCRIPTION: Draws a green rectangle at (147, 178) with width 27 and height 65.
; PLAN: r0=147(x), r1=178(y), r2=27(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 178
LDI r2, 27
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
