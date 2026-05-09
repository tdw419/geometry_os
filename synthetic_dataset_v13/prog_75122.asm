; DESCRIPTION: Draws a orange rectangle at (297, 19) with width 74 and height 78.
; PLAN: r0=297(x), r1=19(y), r2=74(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 19
LDI r2, 74
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
