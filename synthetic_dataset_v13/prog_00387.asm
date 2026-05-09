; DESCRIPTION: Draws a yellow rectangle at (13, 175) with width 90 and height 76.
; PLAN: r0=13(x), r1=175(y), r2=90(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 175
LDI r2, 90
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
