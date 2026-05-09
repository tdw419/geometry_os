; DESCRIPTION: Draws a orange rectangle at (52, 69) with width 61 and height 90.
; PLAN: r0=52(x), r1=69(y), r2=61(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 69
LDI r2, 61
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
