; DESCRIPTION: Draws a red rectangle at (122, 63) with width 79 and height 75.
; PLAN: r0=122(x), r1=63(y), r2=79(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 63
LDI r2, 79
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
