; DESCRIPTION: Draws a yellow rectangle at (438, 108) with width 18 and height 75.
; PLAN: r0=438(x), r1=108(y), r2=18(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 108
LDI r2, 18
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
