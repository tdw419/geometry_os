; DESCRIPTION: Draws a yellow rectangle at (276, 122) with width 90 and height 37.
; PLAN: r0=276(x), r1=122(y), r2=90(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 122
LDI r2, 90
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
