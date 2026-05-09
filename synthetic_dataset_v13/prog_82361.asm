; DESCRIPTION: Draws a white rectangle at (266, 24) with width 85 and height 54.
; PLAN: r0=266(x), r1=24(y), r2=85(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 24
LDI r2, 85
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
