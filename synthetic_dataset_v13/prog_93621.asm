; DESCRIPTION: Draws a yellow rectangle at (270, 76) with width 73 and height 102.
; PLAN: r0=270(x), r1=76(y), r2=73(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 76
LDI r2, 73
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
