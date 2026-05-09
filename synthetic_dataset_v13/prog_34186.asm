; DESCRIPTION: Draws a green rectangle at (452, 91) with width 36 and height 24.
; PLAN: r0=452(x), r1=91(y), r2=36(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 91
LDI r2, 36
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
