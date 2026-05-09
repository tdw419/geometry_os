; DESCRIPTION: Draws a yellow rectangle at (302, 86) with width 91 and height 34.
; PLAN: r0=302(x), r1=86(y), r2=91(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 86
LDI r2, 91
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
