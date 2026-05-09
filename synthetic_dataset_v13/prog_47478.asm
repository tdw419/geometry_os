; DESCRIPTION: Draws a green rectangle at (366, 57) with width 57 and height 54.
; PLAN: r0=366(x), r1=57(y), r2=57(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 57
LDI r2, 57
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
