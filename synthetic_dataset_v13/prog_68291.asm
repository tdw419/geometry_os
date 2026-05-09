; DESCRIPTION: Draws a blue rectangle at (250, 161) with width 60 and height 55.
; PLAN: r0=250(x), r1=161(y), r2=60(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 161
LDI r2, 60
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
