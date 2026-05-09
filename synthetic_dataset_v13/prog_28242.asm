; DESCRIPTION: Draws a blue rectangle at (36, 198) with width 63 and height 34.
; PLAN: r0=36(x), r1=198(y), r2=63(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 198
LDI r2, 63
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
