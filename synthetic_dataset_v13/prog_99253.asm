; DESCRIPTION: Draws a yellow rectangle at (198, 80) with width 65 and height 97.
; PLAN: r0=198(x), r1=80(y), r2=65(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 80
LDI r2, 65
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
