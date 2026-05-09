; DESCRIPTION: Draws a green rectangle at (11, 29) with width 45 and height 76.
; PLAN: r0=11(x), r1=29(y), r2=45(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 29
LDI r2, 45
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
