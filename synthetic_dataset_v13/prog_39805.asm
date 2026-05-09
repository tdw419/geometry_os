; DESCRIPTION: Draws a yellow rectangle at (70, 12) with width 91 and height 90.
; PLAN: r0=70(x), r1=12(y), r2=91(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 12
LDI r2, 91
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
