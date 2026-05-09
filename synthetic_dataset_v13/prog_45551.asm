; DESCRIPTION: Draws a blue rectangle at (366, 24) with width 83 and height 44.
; PLAN: r0=366(x), r1=24(y), r2=83(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 24
LDI r2, 83
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
