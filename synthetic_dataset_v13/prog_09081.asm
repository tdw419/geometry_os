; DESCRIPTION: Draws a yellow rectangle at (264, 194) with width 80 and height 20.
; PLAN: r0=264(x), r1=194(y), r2=80(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 194
LDI r2, 80
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
