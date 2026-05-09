; DESCRIPTION: Draws a green rectangle at (90, 109) with width 119 and height 21.
; PLAN: r0=90(x), r1=109(y), r2=119(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 109
LDI r2, 119
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
