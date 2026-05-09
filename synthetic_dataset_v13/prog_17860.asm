; DESCRIPTION: Draws a yellow rectangle at (80, 194) with width 70 and height 33.
; PLAN: r0=80(x), r1=194(y), r2=70(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 194
LDI r2, 70
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
