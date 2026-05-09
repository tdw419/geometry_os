; DESCRIPTION: Draws a green rectangle at (187, 86) with width 119 and height 19.
; PLAN: r0=187(x), r1=86(y), r2=119(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 86
LDI r2, 119
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
