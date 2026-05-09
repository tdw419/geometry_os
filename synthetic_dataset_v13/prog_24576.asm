; DESCRIPTION: Draws a white rectangle at (95, 116) with width 88 and height 68.
; PLAN: r0=95(x), r1=116(y), r2=88(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 116
LDI r2, 88
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
