; DESCRIPTION: Draws a orange rectangle at (12, 47) with width 101 and height 73.
; PLAN: r0=12(x), r1=47(y), r2=101(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 47
LDI r2, 101
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
