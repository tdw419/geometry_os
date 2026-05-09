; DESCRIPTION: Draws a orange rectangle at (183, 77) with width 74 and height 109.
; PLAN: r0=183(x), r1=77(y), r2=74(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 77
LDI r2, 74
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
