; DESCRIPTION: Draws a green rectangle at (48, 169) with width 11 and height 44.
; PLAN: r0=48(x), r1=169(y), r2=11(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 169
LDI r2, 11
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
