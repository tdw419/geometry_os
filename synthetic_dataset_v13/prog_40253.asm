; DESCRIPTION: Draws a red rectangle at (11, 139) with width 103 and height 35.
; PLAN: r0=11(x), r1=139(y), r2=103(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 139
LDI r2, 103
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
