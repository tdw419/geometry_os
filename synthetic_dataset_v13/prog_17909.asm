; DESCRIPTION: Draws a orange rectangle at (379, 125) with width 94 and height 39.
; PLAN: r0=379(x), r1=125(y), r2=94(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 125
LDI r2, 94
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
