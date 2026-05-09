; DESCRIPTION: Draws a green rectangle at (426, 154) with width 40 and height 81.
; PLAN: r0=426(x), r1=154(y), r2=40(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 154
LDI r2, 40
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
