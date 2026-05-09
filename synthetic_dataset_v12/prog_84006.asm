; DESCRIPTION: Draws a yellow rectangle at (78, 69) with width 79 and height 115.
; PLAN: r0=78(x), r1=69(y), r2=79(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 69
LDI r2, 79
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
