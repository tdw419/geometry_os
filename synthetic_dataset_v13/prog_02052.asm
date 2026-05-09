; DESCRIPTION: Draws a white rectangle at (358, 123) with width 19 and height 42.
; PLAN: r0=358(x), r1=123(y), r2=19(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 123
LDI r2, 19
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
