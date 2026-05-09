; DESCRIPTION: Draws a yellow rectangle at (54, 95) with width 11 and height 15.
; PLAN: r0=54(x), r1=95(y), r2=11(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 95
LDI r2, 11
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
