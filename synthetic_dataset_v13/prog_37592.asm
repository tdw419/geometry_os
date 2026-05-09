; DESCRIPTION: Draws a green rectangle at (281, 140) with width 92 and height 73.
; PLAN: r0=281(x), r1=140(y), r2=92(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 140
LDI r2, 92
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
