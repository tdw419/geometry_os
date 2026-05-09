; DESCRIPTION: Draws a purple rectangle at (203, 229) with width 47 and height 25.
; PLAN: r0=203(x), r1=229(y), r2=47(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 229
LDI r2, 47
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
