; DESCRIPTION: Draws a white rectangle at (325, 79) with width 36 and height 107.
; PLAN: r0=325(x), r1=79(y), r2=36(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 79
LDI r2, 36
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
