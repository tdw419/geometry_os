; DESCRIPTION: Draws a yellow rectangle at (388, 131) with width 96 and height 96.
; PLAN: r0=388(x), r1=131(y), r2=96(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 131
LDI r2, 96
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
