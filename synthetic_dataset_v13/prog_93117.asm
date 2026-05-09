; DESCRIPTION: Draws a white rectangle at (329, 114) with width 28 and height 70.
; PLAN: r0=329(x), r1=114(y), r2=28(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 114
LDI r2, 28
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
