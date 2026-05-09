; DESCRIPTION: Draws a white rectangle at (184, 143) with width 34 and height 59.
; PLAN: r0=184(x), r1=143(y), r2=34(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 143
LDI r2, 34
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
