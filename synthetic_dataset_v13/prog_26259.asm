; DESCRIPTION: Draws a orange rectangle at (250, 87) with width 113 and height 85.
; PLAN: r0=250(x), r1=87(y), r2=113(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 87
LDI r2, 113
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
