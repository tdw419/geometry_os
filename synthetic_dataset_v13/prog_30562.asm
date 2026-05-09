; DESCRIPTION: Draws a yellow rectangle at (167, 131) with width 112 and height 10.
; PLAN: r0=167(x), r1=131(y), r2=112(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 131
LDI r2, 112
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
