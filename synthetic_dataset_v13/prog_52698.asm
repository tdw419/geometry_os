; DESCRIPTION: Draws a red rectangle at (364, 61) with width 117 and height 92.
; PLAN: r0=364(x), r1=61(y), r2=117(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 61
LDI r2, 117
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
