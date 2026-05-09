; DESCRIPTION: Draws a green rectangle at (306, 86) with width 83 and height 46.
; PLAN: r0=306(x), r1=86(y), r2=83(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 86
LDI r2, 83
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
