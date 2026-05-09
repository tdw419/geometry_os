; DESCRIPTION: Draws a yellow rectangle at (239, 65) with width 26 and height 117.
; PLAN: r0=239(x), r1=65(y), r2=26(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 65
LDI r2, 26
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
