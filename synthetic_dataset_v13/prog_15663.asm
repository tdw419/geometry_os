; DESCRIPTION: Draws a green rectangle at (377, 9) with width 63 and height 102.
; PLAN: r0=377(x), r1=9(y), r2=63(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 9
LDI r2, 63
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
