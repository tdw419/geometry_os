; DESCRIPTION: Draws a green rectangle at (45, 138) with width 57 and height 104.
; PLAN: r0=45(x), r1=138(y), r2=57(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 138
LDI r2, 57
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
