; DESCRIPTION: Draws a orange rectangle at (4, 47) with width 84 and height 44.
; PLAN: r0=4(x), r1=47(y), r2=84(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 47
LDI r2, 84
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
