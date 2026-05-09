; DESCRIPTION: Draws a green rectangle at (362, 108) with width 81 and height 43.
; PLAN: r0=362(x), r1=108(y), r2=81(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 108
LDI r2, 81
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
