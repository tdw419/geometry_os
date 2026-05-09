; DESCRIPTION: Draws a orange rectangle at (85, 115) with width 28 and height 79.
; PLAN: r0=85(x), r1=115(y), r2=28(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 115
LDI r2, 28
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
