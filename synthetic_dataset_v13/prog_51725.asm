; DESCRIPTION: Draws a orange rectangle at (230, 30) with width 75 and height 11.
; PLAN: r0=230(x), r1=30(y), r2=75(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 30
LDI r2, 75
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
