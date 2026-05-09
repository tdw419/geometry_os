; DESCRIPTION: Draws a white rectangle at (303, 125) with width 114 and height 100.
; PLAN: r0=303(x), r1=125(y), r2=114(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 125
LDI r2, 114
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
