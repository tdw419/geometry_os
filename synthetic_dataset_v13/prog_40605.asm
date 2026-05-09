; DESCRIPTION: Draws a black rectangle at (77, 126) with width 56 and height 43.
; PLAN: r0=77(x), r1=126(y), r2=56(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 126
LDI r2, 56
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
