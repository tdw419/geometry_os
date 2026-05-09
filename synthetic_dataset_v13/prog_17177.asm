; DESCRIPTION: Draws a red rectangle at (203, 188) with width 79 and height 66.
; PLAN: r0=203(x), r1=188(y), r2=79(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 188
LDI r2, 79
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
