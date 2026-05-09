; DESCRIPTION: Draws a yellow rectangle at (292, 231) with width 40 and height 17.
; PLAN: r0=292(x), r1=231(y), r2=40(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 231
LDI r2, 40
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
