; DESCRIPTION: Draws a white rectangle at (320, 142) with width 115 and height 54.
; PLAN: r0=320(x), r1=142(y), r2=115(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 142
LDI r2, 115
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
