; DESCRIPTION: Draws a green rectangle at (167, 57) with width 92 and height 105.
; PLAN: r0=167(x), r1=57(y), r2=92(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 57
LDI r2, 92
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
