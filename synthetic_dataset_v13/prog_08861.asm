; DESCRIPTION: Draws a green rectangle at (428, 85) with width 84 and height 56.
; PLAN: r0=428(x), r1=85(y), r2=84(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 85
LDI r2, 84
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
