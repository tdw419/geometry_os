; DESCRIPTION: Draws a green rectangle at (174, 115) with width 70 and height 108.
; PLAN: r0=174(x), r1=115(y), r2=70(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 115
LDI r2, 70
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
