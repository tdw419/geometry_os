; DESCRIPTION: Draws a yellow rectangle at (270, 70) with width 91 and height 39.
; PLAN: r0=270(x), r1=70(y), r2=91(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 70
LDI r2, 91
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
