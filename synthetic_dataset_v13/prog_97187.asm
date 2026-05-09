; DESCRIPTION: Draws a black rectangle at (302, 100) with width 23 and height 57.
; PLAN: r0=302(x), r1=100(y), r2=23(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 100
LDI r2, 23
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
