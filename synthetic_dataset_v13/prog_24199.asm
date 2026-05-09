; DESCRIPTION: Draws a orange rectangle at (279, 47) with width 79 and height 84.
; PLAN: r0=279(x), r1=47(y), r2=79(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 47
LDI r2, 79
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
