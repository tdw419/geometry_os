; DESCRIPTION: Draws a green rectangle at (98, 109) with width 58 and height 81.
; PLAN: r0=98(x), r1=109(y), r2=58(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 109
LDI r2, 58
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
