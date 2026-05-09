; DESCRIPTION: Draws a yellow rectangle at (97, 64) with width 80 and height 56.
; PLAN: r0=97(x), r1=64(y), r2=80(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 64
LDI r2, 80
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
