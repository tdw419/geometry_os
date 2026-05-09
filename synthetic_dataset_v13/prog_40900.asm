; DESCRIPTION: Draws a yellow rectangle at (93, 97) with width 108 and height 70.
; PLAN: r0=93(x), r1=97(y), r2=108(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 97
LDI r2, 108
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
