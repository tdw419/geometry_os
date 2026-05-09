; DESCRIPTION: Draws a purple rectangle at (3, 154) with width 80 and height 80.
; PLAN: r0=3(x), r1=154(y), r2=80(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 154
LDI r2, 80
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
