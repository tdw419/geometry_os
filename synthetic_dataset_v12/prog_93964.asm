; DESCRIPTION: Draws a purple rectangle at (382, 47) with width 66 and height 30.
; PLAN: r0=382(x), r1=47(y), r2=66(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 47
LDI r2, 66
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
