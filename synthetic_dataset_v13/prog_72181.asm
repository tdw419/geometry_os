; DESCRIPTION: Draws a black rectangle at (174, 17) with width 64 and height 78.
; PLAN: r0=174(x), r1=17(y), r2=64(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 17
LDI r2, 64
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
