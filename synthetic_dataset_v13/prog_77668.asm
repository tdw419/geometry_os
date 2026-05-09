; DESCRIPTION: Draws a green rectangle at (234, 154) with width 81 and height 25.
; PLAN: r0=234(x), r1=154(y), r2=81(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 154
LDI r2, 81
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
