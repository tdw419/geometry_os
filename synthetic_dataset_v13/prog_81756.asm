; DESCRIPTION: Draws a white rectangle at (399, 163) with width 79 and height 85.
; PLAN: r0=399(x), r1=163(y), r2=79(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 163
LDI r2, 79
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
