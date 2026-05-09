; DESCRIPTION: Draws a green rectangle at (167, 122) with width 21 and height 77.
; PLAN: r0=167(x), r1=122(y), r2=21(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 122
LDI r2, 21
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
