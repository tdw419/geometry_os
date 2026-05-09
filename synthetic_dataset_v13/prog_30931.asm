; DESCRIPTION: Draws a yellow rectangle at (77, 40) with width 58 and height 93.
; PLAN: r0=77(x), r1=40(y), r2=58(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 40
LDI r2, 58
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
