; DESCRIPTION: Draws a black rectangle at (319, 150) with width 105 and height 61.
; PLAN: r0=319(x), r1=150(y), r2=105(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 150
LDI r2, 105
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
