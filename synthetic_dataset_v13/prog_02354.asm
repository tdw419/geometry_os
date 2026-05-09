; DESCRIPTION: Draws a blue rectangle at (79, 133) with width 91 and height 83.
; PLAN: r0=79(x), r1=133(y), r2=91(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 133
LDI r2, 91
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
