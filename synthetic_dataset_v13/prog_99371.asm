; DESCRIPTION: Draws a yellow rectangle at (322, 23) with width 112 and height 87.
; PLAN: r0=322(x), r1=23(y), r2=112(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 23
LDI r2, 112
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
