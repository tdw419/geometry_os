; DESCRIPTION: Draws a white rectangle at (385, 116) with width 10 and height 52.
; PLAN: r0=385(x), r1=116(y), r2=10(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 116
LDI r2, 10
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
