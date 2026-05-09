; DESCRIPTION: Draws a green rectangle at (219, 38) with width 10 and height 30.
; PLAN: r0=219(x), r1=38(y), r2=10(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 38
LDI r2, 10
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
