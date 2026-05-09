; DESCRIPTION: Draws a yellow rectangle at (358, 138) with width 25 and height 58.
; PLAN: r0=358(x), r1=138(y), r2=25(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 138
LDI r2, 25
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
