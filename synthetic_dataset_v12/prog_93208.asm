; DESCRIPTION: Draws a green rectangle at (462, 176) with width 23 and height 48.
; PLAN: r0=462(x), r1=176(y), r2=23(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 176
LDI r2, 23
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
