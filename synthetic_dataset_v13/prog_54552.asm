; DESCRIPTION: Draws a green rectangle at (86, 91) with width 23 and height 14.
; PLAN: r0=86(x), r1=91(y), r2=23(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 91
LDI r2, 23
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
