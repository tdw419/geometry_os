; DESCRIPTION: Draws a green rectangle at (132, 197) with width 70 and height 53.
; PLAN: r0=132(x), r1=197(y), r2=70(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 197
LDI r2, 70
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
