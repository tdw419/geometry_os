; DESCRIPTION: Draws a black rectangle at (15, 54) with width 60 and height 47.
; PLAN: r0=15(x), r1=54(y), r2=60(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 54
LDI r2, 60
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
