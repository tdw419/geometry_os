; DESCRIPTION: Draws a yellow rectangle at (148, 173) with width 93 and height 53.
; PLAN: r0=148(x), r1=173(y), r2=93(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 173
LDI r2, 93
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
