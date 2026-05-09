; DESCRIPTION: Draws a blue rectangle at (411, 7) with width 13 and height 19.
; PLAN: r0=411(x), r1=7(y), r2=13(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 7
LDI r2, 13
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
