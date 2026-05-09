; DESCRIPTION: Draws a yellow rectangle at (389, 68) with width 107 and height 97.
; PLAN: r0=389(x), r1=68(y), r2=107(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 68
LDI r2, 107
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
