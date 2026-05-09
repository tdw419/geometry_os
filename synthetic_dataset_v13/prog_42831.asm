; DESCRIPTION: Draws a green rectangle at (47, 90) with width 21 and height 69.
; PLAN: r0=47(x), r1=90(y), r2=21(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 90
LDI r2, 21
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
