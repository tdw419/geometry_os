; DESCRIPTION: Draws a yellow rectangle at (300, 77) with width 62 and height 108.
; PLAN: r0=300(x), r1=77(y), r2=62(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 77
LDI r2, 62
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
