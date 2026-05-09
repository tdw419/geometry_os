; DESCRIPTION: Draws a black rectangle at (283, 185) with width 52 and height 57.
; PLAN: r0=283(x), r1=185(y), r2=52(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 185
LDI r2, 52
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
