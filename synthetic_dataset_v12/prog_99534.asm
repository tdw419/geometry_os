; DESCRIPTION: Draws a yellow rectangle at (96, 56) with width 91 and height 108.
; PLAN: r0=96(x), r1=56(y), r2=91(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 56
LDI r2, 91
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
