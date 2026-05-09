; DESCRIPTION: Draws a orange rectangle at (1, 103) with width 74 and height 85.
; PLAN: r0=1(x), r1=103(y), r2=74(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 103
LDI r2, 74
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
