; DESCRIPTION: Draws a green rectangle at (381, 180) with width 25 and height 52.
; PLAN: r0=381(x), r1=180(y), r2=25(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 180
LDI r2, 25
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
