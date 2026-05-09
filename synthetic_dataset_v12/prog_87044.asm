; DESCRIPTION: Draws a blue rectangle at (30, 17) with width 115 and height 86.
; PLAN: r0=30(x), r1=17(y), r2=115(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 17
LDI r2, 115
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
