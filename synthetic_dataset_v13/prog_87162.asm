; DESCRIPTION: Draws a purple rectangle at (221, 28) with width 13 and height 18.
; PLAN: r0=221(x), r1=28(y), r2=13(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 28
LDI r2, 13
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
