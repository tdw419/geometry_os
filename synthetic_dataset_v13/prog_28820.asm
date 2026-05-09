; DESCRIPTION: Draws a blue rectangle at (331, 143) with width 31 and height 44.
; PLAN: r0=331(x), r1=143(y), r2=31(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 143
LDI r2, 31
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
