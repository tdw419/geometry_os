; DESCRIPTION: Draws a blue rectangle at (378, 16) with width 80 and height 39.
; PLAN: r0=378(x), r1=16(y), r2=80(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 16
LDI r2, 80
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
