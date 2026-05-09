; DESCRIPTION: Draws a green rectangle at (128, 145) with width 95 and height 97.
; PLAN: r0=128(x), r1=145(y), r2=95(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 145
LDI r2, 95
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
