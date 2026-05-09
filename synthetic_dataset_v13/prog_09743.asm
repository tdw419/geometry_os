; DESCRIPTION: Draws a red rectangle at (218, 20) with width 89 and height 92.
; PLAN: r0=218(x), r1=20(y), r2=89(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 20
LDI r2, 89
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
