; DESCRIPTION: Draws a purple rectangle at (175, 45) with width 39 and height 66.
; PLAN: r0=175(x), r1=45(y), r2=39(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 45
LDI r2, 39
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
