; DESCRIPTION: Draws a green rectangle at (272, 53) with width 59 and height 51.
; PLAN: r0=272(x), r1=53(y), r2=59(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 53
LDI r2, 59
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
