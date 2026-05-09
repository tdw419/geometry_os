; DESCRIPTION: Draws a blue rectangle at (438, 157) with width 70 and height 35.
; PLAN: r0=438(x), r1=157(y), r2=70(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 157
LDI r2, 70
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
