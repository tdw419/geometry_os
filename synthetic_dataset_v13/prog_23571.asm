; DESCRIPTION: Draws a green rectangle at (288, 85) with width 75 and height 36.
; PLAN: r0=288(x), r1=85(y), r2=75(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 85
LDI r2, 75
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
