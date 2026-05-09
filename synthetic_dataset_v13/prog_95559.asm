; DESCRIPTION: Draws a yellow rectangle at (4, 160) with width 83 and height 56.
; PLAN: r0=4(x), r1=160(y), r2=83(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 160
LDI r2, 83
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
