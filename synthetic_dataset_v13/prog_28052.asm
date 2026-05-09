; DESCRIPTION: Draws a blue rectangle at (349, 83) with width 103 and height 44.
; PLAN: r0=349(x), r1=83(y), r2=103(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 83
LDI r2, 103
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
