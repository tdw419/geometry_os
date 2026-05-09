; DESCRIPTION: Draws a green rectangle at (40, 108) with width 103 and height 63.
; PLAN: r0=40(x), r1=108(y), r2=103(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 108
LDI r2, 103
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
