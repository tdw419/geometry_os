; DESCRIPTION: Draws a orange rectangle at (180, 134) with width 79 and height 66.
; PLAN: r0=180(x), r1=134(y), r2=79(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 134
LDI r2, 79
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
