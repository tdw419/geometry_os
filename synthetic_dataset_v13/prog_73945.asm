; DESCRIPTION: Draws a green rectangle at (366, 36) with width 86 and height 97.
; PLAN: r0=366(x), r1=36(y), r2=86(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 36
LDI r2, 86
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
