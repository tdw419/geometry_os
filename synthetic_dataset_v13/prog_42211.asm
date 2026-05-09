; DESCRIPTION: Draws a white rectangle at (170, 131) with width 78 and height 94.
; PLAN: r0=170(x), r1=131(y), r2=78(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 131
LDI r2, 78
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
