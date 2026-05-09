; DESCRIPTION: Draws a green rectangle at (201, 181) with width 85 and height 70.
; PLAN: r0=201(x), r1=181(y), r2=85(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 181
LDI r2, 85
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
