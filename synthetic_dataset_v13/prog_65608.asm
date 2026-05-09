; DESCRIPTION: Draws a white rectangle at (64, 113) with width 54 and height 52.
; PLAN: r0=64(x), r1=113(y), r2=54(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 113
LDI r2, 54
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
