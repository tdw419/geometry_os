; DESCRIPTION: Draws a green rectangle at (241, 36) with width 117 and height 106.
; PLAN: r0=241(x), r1=36(y), r2=117(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 36
LDI r2, 117
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
