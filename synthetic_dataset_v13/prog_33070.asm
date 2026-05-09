; DESCRIPTION: Draws a yellow rectangle at (118, 65) with width 67 and height 108.
; PLAN: r0=118(x), r1=65(y), r2=67(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 65
LDI r2, 67
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
