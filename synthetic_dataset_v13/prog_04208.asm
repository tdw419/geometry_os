; DESCRIPTION: Draws a purple rectangle at (254, 80) with width 49 and height 27.
; PLAN: r0=254(x), r1=80(y), r2=49(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 80
LDI r2, 49
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
