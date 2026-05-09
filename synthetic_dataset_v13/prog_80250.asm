; DESCRIPTION: Draws a orange rectangle at (384, 102) with width 73 and height 110.
; PLAN: r0=384(x), r1=102(y), r2=73(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 102
LDI r2, 73
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
