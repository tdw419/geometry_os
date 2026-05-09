; DESCRIPTION: Draws a red rectangle at (181, 131) with width 118 and height 55.
; PLAN: r0=181(x), r1=131(y), r2=118(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 131
LDI r2, 118
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
