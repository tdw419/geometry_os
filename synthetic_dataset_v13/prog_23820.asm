; DESCRIPTION: Draws a white rectangle at (440, 1) with width 61 and height 74.
; PLAN: r0=440(x), r1=1(y), r2=61(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 1
LDI r2, 61
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
