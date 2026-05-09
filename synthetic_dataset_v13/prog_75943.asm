; DESCRIPTION: Draws a purple rectangle at (370, 114) with width 23 and height 35.
; PLAN: r0=370(x), r1=114(y), r2=23(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 114
LDI r2, 23
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
