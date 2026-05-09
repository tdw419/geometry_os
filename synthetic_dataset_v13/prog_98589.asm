; DESCRIPTION: Draws a orange rectangle at (79, 119) with width 109 and height 27.
; PLAN: r0=79(x), r1=119(y), r2=109(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 119
LDI r2, 109
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
