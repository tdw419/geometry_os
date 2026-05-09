; DESCRIPTION: Draws a white rectangle at (52, 176) with width 115 and height 40.
; PLAN: r0=52(x), r1=176(y), r2=115(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 176
LDI r2, 115
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
