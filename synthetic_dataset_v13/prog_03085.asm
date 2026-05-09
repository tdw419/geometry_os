; DESCRIPTION: Draws a white rectangle at (361, 155) with width 107 and height 61.
; PLAN: r0=361(x), r1=155(y), r2=107(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 155
LDI r2, 107
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
