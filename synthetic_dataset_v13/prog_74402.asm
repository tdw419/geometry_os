; DESCRIPTION: Draws a purple rectangle at (406, 211) with width 92 and height 28.
; PLAN: r0=406(x), r1=211(y), r2=92(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 211
LDI r2, 92
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
