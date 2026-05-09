; DESCRIPTION: Draws a white rectangle at (198, 148) with width 58 and height 81.
; PLAN: r0=198(x), r1=148(y), r2=58(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 148
LDI r2, 58
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
