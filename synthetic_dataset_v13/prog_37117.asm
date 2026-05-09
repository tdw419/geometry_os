; DESCRIPTION: Draws a green rectangle at (91, 5) with width 90 and height 59.
; PLAN: r0=91(x), r1=5(y), r2=90(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 5
LDI r2, 90
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
