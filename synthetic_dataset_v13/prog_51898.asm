; DESCRIPTION: Draws a green rectangle at (410, 155) with width 40 and height 87.
; PLAN: r0=410(x), r1=155(y), r2=40(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 155
LDI r2, 40
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
