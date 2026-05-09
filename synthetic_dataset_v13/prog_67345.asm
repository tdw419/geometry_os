; DESCRIPTION: Draws a green rectangle at (302, 96) with width 45 and height 30.
; PLAN: r0=302(x), r1=96(y), r2=45(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 96
LDI r2, 45
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
