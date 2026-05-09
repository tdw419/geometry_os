; DESCRIPTION: Draws a black rectangle at (283, 172) with width 44 and height 77.
; PLAN: r0=283(x), r1=172(y), r2=44(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 172
LDI r2, 44
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
