; DESCRIPTION: Draws a yellow rectangle at (302, 73) with width 59 and height 75.
; PLAN: r0=302(x), r1=73(y), r2=59(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 73
LDI r2, 59
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
