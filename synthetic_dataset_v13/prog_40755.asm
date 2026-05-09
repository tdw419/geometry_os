; DESCRIPTION: Draws a orange rectangle at (250, 70) with width 61 and height 25.
; PLAN: r0=250(x), r1=70(y), r2=61(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 70
LDI r2, 61
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
