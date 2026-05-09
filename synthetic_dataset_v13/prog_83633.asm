; DESCRIPTION: Draws a white rectangle at (347, 120) with width 81 and height 39.
; PLAN: r0=347(x), r1=120(y), r2=81(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 120
LDI r2, 81
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
