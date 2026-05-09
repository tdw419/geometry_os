; DESCRIPTION: Draws a green rectangle at (341, 121) with width 87 and height 55.
; PLAN: r0=341(x), r1=121(y), r2=87(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 121
LDI r2, 87
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
