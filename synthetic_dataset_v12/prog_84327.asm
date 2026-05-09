; DESCRIPTION: Draws a yellow rectangle at (142, 6) with width 11 and height 57.
; PLAN: r0=142(x), r1=6(y), r2=11(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 6
LDI r2, 11
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
