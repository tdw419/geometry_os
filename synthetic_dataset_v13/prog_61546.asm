; DESCRIPTION: Draws a green rectangle at (26, 58) with width 27 and height 56.
; PLAN: r0=26(x), r1=58(y), r2=27(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 58
LDI r2, 27
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
