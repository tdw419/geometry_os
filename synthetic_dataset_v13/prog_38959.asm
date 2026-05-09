; DESCRIPTION: Draws a black rectangle at (405, 17) with width 63 and height 14.
; PLAN: r0=405(x), r1=17(y), r2=63(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 17
LDI r2, 63
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
