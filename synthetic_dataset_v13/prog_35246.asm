; DESCRIPTION: Draws a blue rectangle at (287, 208) with width 56 and height 10.
; PLAN: r0=287(x), r1=208(y), r2=56(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 208
LDI r2, 56
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
