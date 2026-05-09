; DESCRIPTION: Draws a red rectangle at (179, 97) with width 33 and height 92.
; PLAN: r0=179(x), r1=97(y), r2=33(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 97
LDI r2, 33
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
