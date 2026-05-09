; DESCRIPTION: Draws a black rectangle at (341, 173) with width 37 and height 25.
; PLAN: r0=341(x), r1=173(y), r2=37(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 173
LDI r2, 37
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
