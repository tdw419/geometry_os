; DESCRIPTION: Draws a yellow rectangle at (148, 193) with width 108 and height 53.
; PLAN: r0=148(x), r1=193(y), r2=108(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 193
LDI r2, 108
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
