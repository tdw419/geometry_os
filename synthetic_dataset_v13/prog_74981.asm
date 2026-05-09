; DESCRIPTION: Draws a green rectangle at (350, 70) with width 70 and height 45.
; PLAN: r0=350(x), r1=70(y), r2=70(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 70
LDI r2, 70
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
