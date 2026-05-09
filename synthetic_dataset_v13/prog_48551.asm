; DESCRIPTION: Draws a yellow rectangle at (278, 77) with width 33 and height 56.
; PLAN: r0=278(x), r1=77(y), r2=33(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 77
LDI r2, 33
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
