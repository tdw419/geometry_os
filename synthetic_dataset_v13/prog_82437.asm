; DESCRIPTION: Draws a green rectangle at (264, 155) with width 70 and height 44.
; PLAN: r0=264(x), r1=155(y), r2=70(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 155
LDI r2, 70
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
