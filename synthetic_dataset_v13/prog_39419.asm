; DESCRIPTION: Draws a white rectangle at (358, 79) with width 57 and height 35.
; PLAN: r0=358(x), r1=79(y), r2=57(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 79
LDI r2, 57
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
