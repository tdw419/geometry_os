; DESCRIPTION: Draws a yellow rectangle at (203, 140) with width 113 and height 57.
; PLAN: r0=203(x), r1=140(y), r2=113(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 140
LDI r2, 113
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
