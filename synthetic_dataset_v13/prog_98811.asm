; DESCRIPTION: Draws a yellow rectangle at (340, 65) with width 84 and height 54.
; PLAN: r0=340(x), r1=65(y), r2=84(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 65
LDI r2, 84
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
