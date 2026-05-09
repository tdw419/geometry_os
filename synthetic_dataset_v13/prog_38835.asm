; DESCRIPTION: Draws a green rectangle at (275, 23) with width 34 and height 106.
; PLAN: r0=275(x), r1=23(y), r2=34(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 23
LDI r2, 34
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
