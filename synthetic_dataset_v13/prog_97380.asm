; DESCRIPTION: Draws a white rectangle at (278, 91) with width 82 and height 88.
; PLAN: r0=278(x), r1=91(y), r2=82(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 91
LDI r2, 82
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
