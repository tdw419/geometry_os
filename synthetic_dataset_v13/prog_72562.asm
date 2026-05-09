; DESCRIPTION: Draws a red rectangle at (108, 185) with width 92 and height 29.
; PLAN: r0=108(x), r1=185(y), r2=92(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 185
LDI r2, 92
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
