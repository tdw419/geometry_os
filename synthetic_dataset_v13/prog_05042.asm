; DESCRIPTION: Draws a orange rectangle at (381, 141) with width 49 and height 73.
; PLAN: r0=381(x), r1=141(y), r2=49(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 141
LDI r2, 49
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
