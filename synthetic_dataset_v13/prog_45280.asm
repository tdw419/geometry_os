; DESCRIPTION: Draws a orange rectangle at (177, 1) with width 20 and height 79.
; PLAN: r0=177(x), r1=1(y), r2=20(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 1
LDI r2, 20
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
