; DESCRIPTION: Draws a blue rectangle at (468, 119) with width 37 and height 34.
; PLAN: r0=468(x), r1=119(y), r2=37(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 119
LDI r2, 37
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
