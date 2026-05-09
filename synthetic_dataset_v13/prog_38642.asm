; DESCRIPTION: Draws a black rectangle at (459, 126) with width 17 and height 47.
; PLAN: r0=459(x), r1=126(y), r2=17(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 126
LDI r2, 17
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
