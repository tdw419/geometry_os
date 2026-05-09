; DESCRIPTION: Draws a green rectangle at (272, 133) with width 114 and height 80.
; PLAN: r0=272(x), r1=133(y), r2=114(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 133
LDI r2, 114
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
