; DESCRIPTION: Draws a white rectangle at (148, 155) with width 71 and height 99.
; PLAN: r0=148(x), r1=155(y), r2=71(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 155
LDI r2, 71
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
