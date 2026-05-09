; DESCRIPTION: Draws a white rectangle at (447, 169) with width 52 and height 13.
; PLAN: r0=447(x), r1=169(y), r2=52(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 169
LDI r2, 52
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
