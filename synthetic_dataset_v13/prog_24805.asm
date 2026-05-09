; DESCRIPTION: Draws a red rectangle at (229, 97) with width 17 and height 92.
; PLAN: r0=229(x), r1=97(y), r2=17(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 97
LDI r2, 17
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
