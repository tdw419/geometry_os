; DESCRIPTION: Draws a yellow rectangle at (289, 180) with width 118 and height 49.
; PLAN: r0=289(x), r1=180(y), r2=118(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 180
LDI r2, 118
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
