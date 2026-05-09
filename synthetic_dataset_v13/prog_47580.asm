; DESCRIPTION: Draws a white rectangle at (228, 156) with width 36 and height 97.
; PLAN: r0=228(x), r1=156(y), r2=36(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 156
LDI r2, 36
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
