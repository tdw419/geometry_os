; DESCRIPTION: Draws a red rectangle at (218, 153) with width 35 and height 92.
; PLAN: r0=218(x), r1=153(y), r2=35(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 153
LDI r2, 35
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
