; DESCRIPTION: Draws a white rectangle at (139, 6) with width 55 and height 64.
; PLAN: r0=139(x), r1=6(y), r2=55(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 6
LDI r2, 55
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
