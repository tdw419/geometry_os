; DESCRIPTION: Draws a yellow rectangle at (470, 37) with width 13 and height 117.
; PLAN: r0=470(x), r1=37(y), r2=13(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 37
LDI r2, 13
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
