; DESCRIPTION: Draws a red rectangle at (139, 83) with width 17 and height 109.
; PLAN: r0=139(x), r1=83(y), r2=17(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 83
LDI r2, 17
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
