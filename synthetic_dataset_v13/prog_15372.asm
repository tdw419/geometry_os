; DESCRIPTION: Draws a green rectangle at (283, 24) with width 92 and height 54.
; PLAN: r0=283(x), r1=24(y), r2=92(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 24
LDI r2, 92
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
