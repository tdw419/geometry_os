; DESCRIPTION: Draws a yellow rectangle at (81, 49) with width 36 and height 57.
; PLAN: r0=81(x), r1=49(y), r2=36(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 49
LDI r2, 36
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
