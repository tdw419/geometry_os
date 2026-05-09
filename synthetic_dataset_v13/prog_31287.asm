; DESCRIPTION: Draws a orange rectangle at (40, 89) with width 48 and height 75.
; PLAN: r0=40(x), r1=89(y), r2=48(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 89
LDI r2, 48
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
