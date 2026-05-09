; DESCRIPTION: Draws a white rectangle at (382, 106) with width 60 and height 36.
; PLAN: r0=382(x), r1=106(y), r2=60(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 106
LDI r2, 60
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
