; DESCRIPTION: Draws a black rectangle at (330, 87) with width 96 and height 110.
; PLAN: r0=330(x), r1=87(y), r2=96(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 87
LDI r2, 96
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
