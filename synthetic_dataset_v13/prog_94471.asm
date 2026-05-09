; DESCRIPTION: Draws a purple rectangle at (57, 169) with width 23 and height 53.
; PLAN: r0=57(x), r1=169(y), r2=23(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 169
LDI r2, 23
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
