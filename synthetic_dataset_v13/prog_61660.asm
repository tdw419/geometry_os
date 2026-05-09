; DESCRIPTION: Draws a green rectangle at (330, 91) with width 36 and height 45.
; PLAN: r0=330(x), r1=91(y), r2=36(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 91
LDI r2, 36
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
