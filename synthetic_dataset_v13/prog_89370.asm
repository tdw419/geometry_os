; DESCRIPTION: Draws a green rectangle at (325, 54) with width 87 and height 71.
; PLAN: r0=325(x), r1=54(y), r2=87(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 54
LDI r2, 87
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
