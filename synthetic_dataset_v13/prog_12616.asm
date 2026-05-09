; DESCRIPTION: Draws a white rectangle at (5, 37) with width 74 and height 49.
; PLAN: r0=5(x), r1=37(y), r2=74(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 37
LDI r2, 74
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
