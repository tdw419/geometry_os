; DESCRIPTION: Draws a purple rectangle at (218, 132) with width 44 and height 17.
; PLAN: r0=218(x), r1=132(y), r2=44(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 132
LDI r2, 44
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
