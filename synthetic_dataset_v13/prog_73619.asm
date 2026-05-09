; DESCRIPTION: Draws a green rectangle at (89, 116) with width 87 and height 65.
; PLAN: r0=89(x), r1=116(y), r2=87(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 116
LDI r2, 87
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
