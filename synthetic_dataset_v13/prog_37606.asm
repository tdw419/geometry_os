; DESCRIPTION: Draws a green rectangle at (18, 132) with width 19 and height 52.
; PLAN: r0=18(x), r1=132(y), r2=19(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 132
LDI r2, 19
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
