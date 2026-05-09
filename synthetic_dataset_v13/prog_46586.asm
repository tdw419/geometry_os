; DESCRIPTION: Draws a white rectangle at (296, 70) with width 94 and height 112.
; PLAN: r0=296(x), r1=70(y), r2=94(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 70
LDI r2, 94
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
