; DESCRIPTION: Draws a purple rectangle at (340, 90) with width 80 and height 102.
; PLAN: r0=340(x), r1=90(y), r2=80(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 90
LDI r2, 80
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
