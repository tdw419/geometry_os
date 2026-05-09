; DESCRIPTION: Draws a black rectangle at (332, 173) with width 86 and height 17.
; PLAN: r0=332(x), r1=173(y), r2=86(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 173
LDI r2, 86
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
