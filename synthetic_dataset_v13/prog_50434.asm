; DESCRIPTION: Draws a black rectangle at (17, 189) with width 57 and height 57.
; PLAN: r0=17(x), r1=189(y), r2=57(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 189
LDI r2, 57
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
