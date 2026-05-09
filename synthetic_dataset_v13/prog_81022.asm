; DESCRIPTION: Draws a orange rectangle at (179, 85) with width 102 and height 107.
; PLAN: r0=179(x), r1=85(y), r2=102(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 85
LDI r2, 102
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
