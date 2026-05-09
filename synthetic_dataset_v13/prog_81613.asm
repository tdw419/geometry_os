; DESCRIPTION: Draws a white rectangle at (182, 21) with width 25 and height 81.
; PLAN: r0=182(x), r1=21(y), r2=25(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 21
LDI r2, 25
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
