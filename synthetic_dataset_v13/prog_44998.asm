; DESCRIPTION: Draws a blue rectangle at (169, 115) with width 90 and height 117.
; PLAN: r0=169(x), r1=115(y), r2=90(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 115
LDI r2, 90
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
