; DESCRIPTION: Draws a white rectangle at (340, 40) with width 114 and height 99.
; PLAN: r0=340(x), r1=40(y), r2=114(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 40
LDI r2, 114
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
