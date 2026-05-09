; DESCRIPTION: Draws a green rectangle at (274, 82) with width 106 and height 22.
; PLAN: r0=274(x), r1=82(y), r2=106(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 82
LDI r2, 106
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
