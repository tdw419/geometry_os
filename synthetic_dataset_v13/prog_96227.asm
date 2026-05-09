; DESCRIPTION: Draws a yellow rectangle at (80, 125) with width 21 and height 11.
; PLAN: r0=80(x), r1=125(y), r2=21(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 125
LDI r2, 21
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
