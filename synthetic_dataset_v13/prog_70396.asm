; DESCRIPTION: Draws a blue rectangle at (223, 117) with width 55 and height 47.
; PLAN: r0=223(x), r1=117(y), r2=55(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 117
LDI r2, 55
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
