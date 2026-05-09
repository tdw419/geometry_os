; DESCRIPTION: Draws a orange rectangle at (433, 100) with width 79 and height 110.
; PLAN: r0=433(x), r1=100(y), r2=79(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 100
LDI r2, 79
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
