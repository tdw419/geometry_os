; DESCRIPTION: Draws a green rectangle at (83, 38) with width 100 and height 16.
; PLAN: r0=83(x), r1=38(y), r2=100(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 38
LDI r2, 100
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
