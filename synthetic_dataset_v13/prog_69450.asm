; DESCRIPTION: Draws a black rectangle at (75, 54) with width 93 and height 104.
; PLAN: r0=75(x), r1=54(y), r2=93(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 54
LDI r2, 93
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
