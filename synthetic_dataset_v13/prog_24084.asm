; DESCRIPTION: Draws a green rectangle at (264, 140) with width 102 and height 10.
; PLAN: r0=264(x), r1=140(y), r2=102(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 140
LDI r2, 102
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
