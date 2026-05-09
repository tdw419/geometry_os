; DESCRIPTION: Draws a green rectangle at (188, 25) with width 79 and height 46.
; PLAN: r0=188(x), r1=25(y), r2=79(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 25
LDI r2, 79
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
