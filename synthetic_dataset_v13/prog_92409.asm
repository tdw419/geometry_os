; DESCRIPTION: Draws a yellow rectangle at (185, 36) with width 105 and height 34.
; PLAN: r0=185(x), r1=36(y), r2=105(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 36
LDI r2, 105
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
