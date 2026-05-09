; DESCRIPTION: Draws a purple rectangle at (277, 12) with width 28 and height 15.
; PLAN: r0=277(x), r1=12(y), r2=28(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 12
LDI r2, 28
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
