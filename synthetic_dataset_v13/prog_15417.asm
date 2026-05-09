; DESCRIPTION: Draws a red rectangle at (381, 139) with width 95 and height 38.
; PLAN: r0=381(x), r1=139(y), r2=95(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 139
LDI r2, 95
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
