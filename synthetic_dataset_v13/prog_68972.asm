; DESCRIPTION: Draws a white rectangle at (336, 9) with width 100 and height 16.
; PLAN: r0=336(x), r1=9(y), r2=100(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 9
LDI r2, 100
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
