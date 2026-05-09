; DESCRIPTION: Draws a white rectangle at (382, 37) with width 115 and height 117.
; PLAN: r0=382(x), r1=37(y), r2=115(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 37
LDI r2, 115
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
