; DESCRIPTION: Draws a white rectangle at (70, 12) with width 116 and height 66.
; PLAN: r0=70(x), r1=12(y), r2=116(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 12
LDI r2, 116
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
