; DESCRIPTION: Draws a green rectangle at (19, 109) with width 45 and height 105.
; PLAN: r0=19(x), r1=109(y), r2=45(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 109
LDI r2, 45
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
