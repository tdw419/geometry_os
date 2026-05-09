; DESCRIPTION: Draws a white rectangle at (308, 23) with width 88 and height 25.
; PLAN: r0=308(x), r1=23(y), r2=88(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 23
LDI r2, 88
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
