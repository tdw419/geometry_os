; DESCRIPTION: Draws a black rectangle at (263, 110) with width 105 and height 48.
; PLAN: r0=263(x), r1=110(y), r2=105(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 110
LDI r2, 105
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
