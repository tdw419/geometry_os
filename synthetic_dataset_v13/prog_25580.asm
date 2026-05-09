; DESCRIPTION: Draws a yellow rectangle at (283, 49) with width 52 and height 34.
; PLAN: r0=283(x), r1=49(y), r2=52(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 49
LDI r2, 52
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
