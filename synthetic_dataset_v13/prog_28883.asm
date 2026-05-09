; DESCRIPTION: Draws a blue rectangle at (417, 185) with width 79 and height 44.
; PLAN: r0=417(x), r1=185(y), r2=79(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 185
LDI r2, 79
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
