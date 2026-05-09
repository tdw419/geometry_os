; DESCRIPTION: Draws a purple rectangle at (308, 1) with width 12 and height 23.
; PLAN: r0=308(x), r1=1(y), r2=12(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 1
LDI r2, 12
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
