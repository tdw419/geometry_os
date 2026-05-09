; DESCRIPTION: Draws a green rectangle at (54, 23) with width 18 and height 95.
; PLAN: r0=54(x), r1=23(y), r2=18(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 23
LDI r2, 18
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
