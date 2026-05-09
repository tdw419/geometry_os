; DESCRIPTION: Draws a green rectangle at (412, 128) with width 90 and height 119.
; PLAN: r0=412(x), r1=128(y), r2=90(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 128
LDI r2, 90
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
