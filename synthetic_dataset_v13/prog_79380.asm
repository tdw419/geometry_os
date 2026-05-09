; DESCRIPTION: Draws a white rectangle at (24, 174) with width 116 and height 76.
; PLAN: r0=24(x), r1=174(y), r2=116(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 174
LDI r2, 116
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
