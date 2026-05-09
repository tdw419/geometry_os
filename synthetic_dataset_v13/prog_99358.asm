; DESCRIPTION: Draws a cyan rectangle at (139, 30) with width 112 and height 55.
; PLAN: r0=139(x), r1=30(y), r2=112(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 30
LDI r2, 112
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
