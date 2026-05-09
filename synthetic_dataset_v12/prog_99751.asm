; DESCRIPTION: Draws a yellow rectangle at (237, 142) with width 101 and height 31.
; PLAN: r0=237(x), r1=142(y), r2=101(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 142
LDI r2, 101
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
