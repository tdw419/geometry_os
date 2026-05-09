; DESCRIPTION: Draws a red rectangle at (139, 241) with width 103 and height 14.
; PLAN: r0=139(x), r1=241(y), r2=103(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 241
LDI r2, 103
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
