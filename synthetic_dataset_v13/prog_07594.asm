; DESCRIPTION: Draws a black rectangle at (6, 20) with width 102 and height 87.
; PLAN: r0=6(x), r1=20(y), r2=102(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 20
LDI r2, 102
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
