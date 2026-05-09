; DESCRIPTION: Draws a green rectangle at (118, 45) with width 14 and height 55.
; PLAN: r0=118(x), r1=45(y), r2=14(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 45
LDI r2, 14
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
