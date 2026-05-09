; DESCRIPTION: Draws a green rectangle at (0, 241) with width 36 and height 11.
; PLAN: r0=0(x), r1=241(y), r2=36(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 241
LDI r2, 36
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
