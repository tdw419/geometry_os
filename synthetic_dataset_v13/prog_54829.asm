; DESCRIPTION: Draws a green rectangle at (442, 97) with width 47 and height 108.
; PLAN: r0=442(x), r1=97(y), r2=47(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 97
LDI r2, 47
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
