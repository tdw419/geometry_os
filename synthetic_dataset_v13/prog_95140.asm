; DESCRIPTION: Draws a black rectangle at (283, 94) with width 38 and height 63.
; PLAN: r0=283(x), r1=94(y), r2=38(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 94
LDI r2, 38
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
