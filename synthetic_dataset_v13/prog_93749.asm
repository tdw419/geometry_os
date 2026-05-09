; DESCRIPTION: Draws a blue rectangle at (475, 86) with width 34 and height 83.
; PLAN: r0=475(x), r1=86(y), r2=34(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 86
LDI r2, 34
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
