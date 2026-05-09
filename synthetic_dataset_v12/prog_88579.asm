; DESCRIPTION: Draws a green rectangle at (393, 184) with width 63 and height 70.
; PLAN: r0=393(x), r1=184(y), r2=63(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 184
LDI r2, 63
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
