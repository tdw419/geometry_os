; DESCRIPTION: Draws a white rectangle at (60, 6) with width 52 and height 101.
; PLAN: r0=60(x), r1=6(y), r2=52(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 6
LDI r2, 52
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
