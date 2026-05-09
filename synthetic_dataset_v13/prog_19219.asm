; DESCRIPTION: Draws a orange rectangle at (313, 145) with width 89 and height 21.
; PLAN: r0=313(x), r1=145(y), r2=89(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 145
LDI r2, 89
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
