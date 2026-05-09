; DESCRIPTION: Draws a yellow rectangle at (272, 23) with width 91 and height 43.
; PLAN: r0=272(x), r1=23(y), r2=91(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 23
LDI r2, 91
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
