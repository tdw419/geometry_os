; DESCRIPTION: Draws a red rectangle at (170, 75) with width 92 and height 59.
; PLAN: r0=170(x), r1=75(y), r2=92(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 75
LDI r2, 92
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
