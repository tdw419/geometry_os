; DESCRIPTION: Draws a black rectangle at (454, 36) with width 49 and height 94.
; PLAN: r0=454(x), r1=36(y), r2=49(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 36
LDI r2, 49
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
