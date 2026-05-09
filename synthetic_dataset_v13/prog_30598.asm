; DESCRIPTION: Draws a purple rectangle at (454, 91) with width 18 and height 59.
; PLAN: r0=454(x), r1=91(y), r2=18(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 91
LDI r2, 18
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
