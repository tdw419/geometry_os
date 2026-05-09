; DESCRIPTION: Draws a green rectangle at (80, 28) with width 94 and height 83.
; PLAN: r0=80(x), r1=28(y), r2=94(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 28
LDI r2, 94
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
