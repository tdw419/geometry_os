; DESCRIPTION: Draws a yellow rectangle at (132, 93) with width 33 and height 38.
; PLAN: r0=132(x), r1=93(y), r2=33(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 93
LDI r2, 33
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
