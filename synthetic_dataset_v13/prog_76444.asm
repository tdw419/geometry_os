; DESCRIPTION: Draws a yellow rectangle at (30, 151) with width 47 and height 36.
; PLAN: r0=30(x), r1=151(y), r2=47(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 151
LDI r2, 47
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
