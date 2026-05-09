; DESCRIPTION: Draws a white rectangle at (26, 7) with width 14 and height 47.
; PLAN: r0=26(x), r1=7(y), r2=14(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 7
LDI r2, 14
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
