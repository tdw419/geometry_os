; DESCRIPTION: Draws a purple rectangle at (94, 137) with width 44 and height 28.
; PLAN: r0=94(x), r1=137(y), r2=44(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 137
LDI r2, 44
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
