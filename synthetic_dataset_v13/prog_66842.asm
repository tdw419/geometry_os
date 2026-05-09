; DESCRIPTION: Draws a green rectangle at (326, 62) with width 14 and height 118.
; PLAN: r0=326(x), r1=62(y), r2=14(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 62
LDI r2, 14
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
