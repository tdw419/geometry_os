; DESCRIPTION: Draws a white rectangle at (276, 68) with width 48 and height 43.
; PLAN: r0=276(x), r1=68(y), r2=48(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 68
LDI r2, 48
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
