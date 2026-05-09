; DESCRIPTION: Draws a black rectangle at (268, 57) with width 96 and height 35.
; PLAN: r0=268(x), r1=57(y), r2=96(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 57
LDI r2, 96
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
