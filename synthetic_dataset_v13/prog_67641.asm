; DESCRIPTION: Draws a white rectangle at (13, 173) with width 34 and height 74.
; PLAN: r0=13(x), r1=173(y), r2=34(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 173
LDI r2, 34
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
