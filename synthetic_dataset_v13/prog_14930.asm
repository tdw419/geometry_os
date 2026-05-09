; DESCRIPTION: Draws a yellow rectangle at (78, 212) with width 15 and height 10.
; PLAN: r0=78(x), r1=212(y), r2=15(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 212
LDI r2, 15
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
