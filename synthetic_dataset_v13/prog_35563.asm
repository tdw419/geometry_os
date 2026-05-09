; DESCRIPTION: Draws a yellow rectangle at (323, 4) with width 110 and height 70.
; PLAN: r0=323(x), r1=4(y), r2=110(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 4
LDI r2, 110
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
