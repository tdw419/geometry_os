; DESCRIPTION: Draws a green rectangle at (292, 63) with width 54 and height 117.
; PLAN: r0=292(x), r1=63(y), r2=54(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 63
LDI r2, 54
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
