; DESCRIPTION: Draws a green rectangle at (208, 83) with width 31 and height 100.
; PLAN: r0=208(x), r1=83(y), r2=31(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 83
LDI r2, 31
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
