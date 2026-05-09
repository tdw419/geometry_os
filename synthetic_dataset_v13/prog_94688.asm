; DESCRIPTION: Draws a purple rectangle at (283, 108) with width 52 and height 77.
; PLAN: r0=283(x), r1=108(y), r2=52(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 108
LDI r2, 52
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
