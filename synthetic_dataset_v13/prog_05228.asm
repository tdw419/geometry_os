; DESCRIPTION: Draws a yellow rectangle at (226, 94) with width 108 and height 74.
; PLAN: r0=226(x), r1=94(y), r2=108(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 94
LDI r2, 108
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
