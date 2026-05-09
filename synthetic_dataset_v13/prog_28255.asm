; DESCRIPTION: Draws a green rectangle at (132, 144) with width 116 and height 50.
; PLAN: r0=132(x), r1=144(y), r2=116(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 144
LDI r2, 116
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
