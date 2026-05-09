; DESCRIPTION: Draws a white rectangle at (278, 144) with width 36 and height 54.
; PLAN: r0=278(x), r1=144(y), r2=36(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 144
LDI r2, 36
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
