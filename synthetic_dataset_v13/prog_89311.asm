; DESCRIPTION: Draws a yellow rectangle at (250, 27) with width 49 and height 112.
; PLAN: r0=250(x), r1=27(y), r2=49(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 27
LDI r2, 49
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
