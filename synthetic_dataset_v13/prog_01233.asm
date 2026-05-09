; DESCRIPTION: Draws a green rectangle at (6, 94) with width 38 and height 21.
; PLAN: r0=6(x), r1=94(y), r2=38(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 94
LDI r2, 38
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
