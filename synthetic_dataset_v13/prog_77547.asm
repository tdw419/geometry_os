; DESCRIPTION: Draws a white rectangle at (296, 83) with width 90 and height 20.
; PLAN: r0=296(x), r1=83(y), r2=90(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 83
LDI r2, 90
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
