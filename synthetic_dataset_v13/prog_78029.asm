; DESCRIPTION: Draws a green rectangle at (94, 128) with width 68 and height 29.
; PLAN: r0=94(x), r1=128(y), r2=68(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 128
LDI r2, 68
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
