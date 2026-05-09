; DESCRIPTION: Draws a green rectangle at (392, 158) with width 72 and height 43.
; PLAN: r0=392(x), r1=158(y), r2=72(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 158
LDI r2, 72
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
