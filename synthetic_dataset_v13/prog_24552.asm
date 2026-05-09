; DESCRIPTION: Draws a green rectangle at (37, 131) with width 61 and height 73.
; PLAN: r0=37(x), r1=131(y), r2=61(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 131
LDI r2, 61
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
