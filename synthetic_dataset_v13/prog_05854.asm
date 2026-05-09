; DESCRIPTION: Draws a green rectangle at (332, 46) with width 87 and height 63.
; PLAN: r0=332(x), r1=46(y), r2=87(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 46
LDI r2, 87
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
