; DESCRIPTION: Draws a red rectangle at (53, 35) with width 31 and height 75.
; PLAN: r0=53(x), r1=35(y), r2=31(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 35
LDI r2, 31
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
