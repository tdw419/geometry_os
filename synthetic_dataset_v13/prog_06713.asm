; DESCRIPTION: Draws a black rectangle at (165, 52) with width 110 and height 61.
; PLAN: r0=165(x), r1=52(y), r2=110(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 52
LDI r2, 110
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
