; DESCRIPTION: Draws a blue rectangle at (36, 15) with width 61 and height 13.
; PLAN: r0=36(x), r1=15(y), r2=61(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 15
LDI r2, 61
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
