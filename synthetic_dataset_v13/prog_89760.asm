; DESCRIPTION: Draws a orange rectangle at (166, 180) with width 105 and height 47.
; PLAN: r0=166(x), r1=180(y), r2=105(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 180
LDI r2, 105
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
