; DESCRIPTION: Draws a orange rectangle at (157, 107) with width 74 and height 35.
; PLAN: r0=157(x), r1=107(y), r2=74(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 107
LDI r2, 74
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
