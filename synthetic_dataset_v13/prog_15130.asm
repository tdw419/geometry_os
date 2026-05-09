; DESCRIPTION: Draws a white rectangle at (219, 132) with width 17 and height 50.
; PLAN: r0=219(x), r1=132(y), r2=17(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 132
LDI r2, 17
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
