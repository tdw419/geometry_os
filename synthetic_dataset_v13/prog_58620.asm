; DESCRIPTION: Draws a white rectangle at (328, 36) with width 90 and height 75.
; PLAN: r0=328(x), r1=36(y), r2=90(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 36
LDI r2, 90
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
