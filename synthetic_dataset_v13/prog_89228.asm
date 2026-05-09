; DESCRIPTION: Draws a green rectangle at (3, 168) with width 94 and height 88.
; PLAN: r0=3(x), r1=168(y), r2=94(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 168
LDI r2, 94
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
