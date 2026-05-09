; DESCRIPTION: Draws a white rectangle at (144, 126) with width 37 and height 115.
; PLAN: r0=144(x), r1=126(y), r2=37(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 126
LDI r2, 37
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
