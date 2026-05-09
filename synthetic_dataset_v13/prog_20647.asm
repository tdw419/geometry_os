; DESCRIPTION: Draws a yellow rectangle at (255, 119) with width 30 and height 106.
; PLAN: r0=255(x), r1=119(y), r2=30(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 119
LDI r2, 30
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
