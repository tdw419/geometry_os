; DESCRIPTION: Draws a white rectangle at (8, 26) with width 79 and height 68.
; PLAN: r0=8(x), r1=26(y), r2=79(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 26
LDI r2, 79
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
