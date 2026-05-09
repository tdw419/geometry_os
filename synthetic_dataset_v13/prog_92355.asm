; DESCRIPTION: Draws a yellow rectangle at (249, 95) with width 108 and height 26.
; PLAN: r0=249(x), r1=95(y), r2=108(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 95
LDI r2, 108
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
