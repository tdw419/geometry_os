; DESCRIPTION: Draws a white rectangle at (270, 58) with width 74 and height 77.
; PLAN: r0=270(x), r1=58(y), r2=74(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 58
LDI r2, 74
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
