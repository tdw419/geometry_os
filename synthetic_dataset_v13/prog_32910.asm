; DESCRIPTION: Draws a black rectangle at (251, 226) with width 21 and height 15.
; PLAN: r0=251(x), r1=226(y), r2=21(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 226
LDI r2, 21
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
