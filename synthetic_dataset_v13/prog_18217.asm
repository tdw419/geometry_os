; DESCRIPTION: Draws a white rectangle at (368, 110) with width 71 and height 114.
; PLAN: r0=368(x), r1=110(y), r2=71(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 110
LDI r2, 71
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
