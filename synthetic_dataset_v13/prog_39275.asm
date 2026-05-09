; DESCRIPTION: Draws a green rectangle at (243, 128) with width 118 and height 50.
; PLAN: r0=243(x), r1=128(y), r2=118(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 128
LDI r2, 118
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
