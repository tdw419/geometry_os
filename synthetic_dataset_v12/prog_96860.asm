; DESCRIPTION: Draws a white rectangle at (392, 158) with width 113 and height 88.
; PLAN: r0=392(x), r1=158(y), r2=113(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 158
LDI r2, 113
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
