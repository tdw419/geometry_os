; DESCRIPTION: Draws a red rectangle at (159, 36) with width 104 and height 99.
; PLAN: r0=159(x), r1=36(y), r2=104(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 36
LDI r2, 104
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
