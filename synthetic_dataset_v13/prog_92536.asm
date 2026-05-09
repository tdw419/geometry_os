; DESCRIPTION: Draws a white rectangle at (422, 13) with width 85 and height 74.
; PLAN: r0=422(x), r1=13(y), r2=85(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 13
LDI r2, 85
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
