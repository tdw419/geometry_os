; DESCRIPTION: Draws a yellow rectangle at (77, 2) with width 24 and height 96.
; PLAN: r0=77(x), r1=2(y), r2=24(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 2
LDI r2, 24
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
