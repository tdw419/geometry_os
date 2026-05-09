; DESCRIPTION: Draws a green rectangle at (73, 30) with width 109 and height 45.
; PLAN: r0=73(x), r1=30(y), r2=109(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 30
LDI r2, 109
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
