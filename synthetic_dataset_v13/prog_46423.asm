; DESCRIPTION: Draws a green rectangle at (189, 86) with width 46 and height 101.
; PLAN: r0=189(x), r1=86(y), r2=46(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 86
LDI r2, 46
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
