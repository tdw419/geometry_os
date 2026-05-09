; DESCRIPTION: Draws a white rectangle at (200, 113) with width 62 and height 60.
; PLAN: r0=200(x), r1=113(y), r2=62(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 113
LDI r2, 62
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
