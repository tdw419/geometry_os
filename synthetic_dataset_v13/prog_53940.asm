; DESCRIPTION: Draws a orange rectangle at (53, 107) with width 62 and height 106.
; PLAN: r0=53(x), r1=107(y), r2=62(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 107
LDI r2, 62
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
