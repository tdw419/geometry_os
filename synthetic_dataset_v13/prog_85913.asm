; DESCRIPTION: Draws a yellow rectangle at (131, 90) with width 103 and height 52.
; PLAN: r0=131(x), r1=90(y), r2=103(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 90
LDI r2, 103
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
