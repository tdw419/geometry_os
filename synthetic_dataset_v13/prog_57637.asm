; DESCRIPTION: Draws a black rectangle at (35, 87) with width 74 and height 17.
; PLAN: r0=35(x), r1=87(y), r2=74(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 87
LDI r2, 74
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
