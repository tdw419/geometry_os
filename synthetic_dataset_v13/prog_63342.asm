; DESCRIPTION: Draws a black rectangle at (439, 148) with width 17 and height 61.
; PLAN: r0=439(x), r1=148(y), r2=17(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 148
LDI r2, 17
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
