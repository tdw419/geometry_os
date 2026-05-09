; DESCRIPTION: Draws a white rectangle at (206, 109) with width 55 and height 66.
; PLAN: r0=206(x), r1=109(y), r2=55(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 109
LDI r2, 55
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
