; DESCRIPTION: Draws a white rectangle at (196, 3) with width 40 and height 114.
; PLAN: r0=196(x), r1=3(y), r2=40(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 3
LDI r2, 40
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
