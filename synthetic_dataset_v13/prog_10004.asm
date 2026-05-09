; DESCRIPTION: Draws a green rectangle at (167, 3) with width 105 and height 87.
; PLAN: r0=167(x), r1=3(y), r2=105(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 3
LDI r2, 105
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
