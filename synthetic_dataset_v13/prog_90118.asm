; DESCRIPTION: Draws a red rectangle at (313, 121) with width 74 and height 92.
; PLAN: r0=313(x), r1=121(y), r2=74(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 121
LDI r2, 74
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
