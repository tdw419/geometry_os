; DESCRIPTION: Draws a blue rectangle at (287, 120) with width 44 and height 89.
; PLAN: r0=287(x), r1=120(y), r2=44(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 120
LDI r2, 44
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
