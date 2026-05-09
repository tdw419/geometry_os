; DESCRIPTION: Draws a green rectangle at (22, 126) with width 90 and height 69.
; PLAN: r0=22(x), r1=126(y), r2=90(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 126
LDI r2, 90
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
