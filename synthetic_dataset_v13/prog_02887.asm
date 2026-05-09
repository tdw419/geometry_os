; DESCRIPTION: Draws a purple rectangle at (23, 28) with width 120 and height 88.
; PLAN: r0=23(x), r1=28(y), r2=120(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 28
LDI r2, 120
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
