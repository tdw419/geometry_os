; DESCRIPTION: Draws a black rectangle at (113, 6) with width 94 and height 87.
; PLAN: r0=113(x), r1=6(y), r2=94(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 6
LDI r2, 94
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
