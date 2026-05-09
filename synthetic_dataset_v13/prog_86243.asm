; DESCRIPTION: Draws a green rectangle at (321, 134) with width 45 and height 35.
; PLAN: r0=321(x), r1=134(y), r2=45(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 134
LDI r2, 45
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
