; DESCRIPTION: Draws a blue rectangle at (306, 162) with width 70 and height 55.
; PLAN: r0=306(x), r1=162(y), r2=70(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 162
LDI r2, 70
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
