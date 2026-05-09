; DESCRIPTION: Draws a black rectangle at (431, 91) with width 33 and height 108.
; PLAN: r0=431(x), r1=91(y), r2=33(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 91
LDI r2, 33
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
