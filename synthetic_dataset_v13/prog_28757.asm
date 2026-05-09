; DESCRIPTION: Draws a white rectangle at (38, 54) with width 12 and height 30.
; PLAN: r0=38(x), r1=54(y), r2=12(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 54
LDI r2, 12
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
