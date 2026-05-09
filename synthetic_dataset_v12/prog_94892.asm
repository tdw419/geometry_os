; DESCRIPTION: Draws a orange rectangle at (279, 179) with width 74 and height 66.
; PLAN: r0=279(x), r1=179(y), r2=74(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 179
LDI r2, 74
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
