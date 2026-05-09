; DESCRIPTION: Draws a green rectangle at (484, 72) with width 13 and height 39.
; PLAN: r0=484(x), r1=72(y), r2=13(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 72
LDI r2, 13
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
