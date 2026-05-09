; DESCRIPTION: Draws a white rectangle at (184, 142) with width 38 and height 72.
; PLAN: r0=184(x), r1=142(y), r2=38(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 142
LDI r2, 38
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
