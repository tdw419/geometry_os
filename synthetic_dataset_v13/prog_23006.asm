; DESCRIPTION: Draws a green rectangle at (440, 163) with width 33 and height 71.
; PLAN: r0=440(x), r1=163(y), r2=33(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 163
LDI r2, 33
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
