; DESCRIPTION: Draws a yellow rectangle at (236, 74) with width 62 and height 106.
; PLAN: r0=236(x), r1=74(y), r2=62(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 74
LDI r2, 62
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
