; DESCRIPTION: Draws a white rectangle at (337, 93) with width 43 and height 52.
; PLAN: r0=337(x), r1=93(y), r2=43(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 93
LDI r2, 43
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
