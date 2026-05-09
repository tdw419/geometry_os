; DESCRIPTION: Draws a red rectangle at (85, 66) with width 119 and height 70.
; PLAN: r0=85(x), r1=66(y), r2=119(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 66
LDI r2, 119
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
