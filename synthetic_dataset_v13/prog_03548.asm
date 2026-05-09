; DESCRIPTION: Draws a orange rectangle at (120, 1) with width 96 and height 87.
; PLAN: r0=120(x), r1=1(y), r2=96(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 1
LDI r2, 96
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
