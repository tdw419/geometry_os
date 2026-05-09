; DESCRIPTION: Draws a green rectangle at (338, 91) with width 102 and height 95.
; PLAN: r0=338(x), r1=91(y), r2=102(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 91
LDI r2, 102
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
