; DESCRIPTION: Draws a blue rectangle at (361, 97) with width 61 and height 54.
; PLAN: r0=361(x), r1=97(y), r2=61(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 97
LDI r2, 61
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
