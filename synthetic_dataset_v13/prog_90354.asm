; DESCRIPTION: Draws a purple rectangle at (75, 1) with width 30 and height 91.
; PLAN: r0=75(x), r1=1(y), r2=30(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 1
LDI r2, 30
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
