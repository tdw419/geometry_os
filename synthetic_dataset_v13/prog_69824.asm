; DESCRIPTION: Draws a green rectangle at (83, 90) with width 111 and height 101.
; PLAN: r0=83(x), r1=90(y), r2=111(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 90
LDI r2, 111
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
