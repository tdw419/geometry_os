; DESCRIPTION: Draws a green rectangle at (213, 197) with width 88 and height 43.
; PLAN: r0=213(x), r1=197(y), r2=88(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 197
LDI r2, 88
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
