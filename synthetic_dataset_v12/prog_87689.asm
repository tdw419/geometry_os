; DESCRIPTION: Draws a yellow rectangle at (286, 74) with width 97 and height 117.
; PLAN: r0=286(x), r1=74(y), r2=97(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 74
LDI r2, 97
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
