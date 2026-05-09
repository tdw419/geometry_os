; DESCRIPTION: Draws a yellow rectangle at (262, 132) with width 75 and height 110.
; PLAN: r0=262(x), r1=132(y), r2=75(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 132
LDI r2, 75
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
