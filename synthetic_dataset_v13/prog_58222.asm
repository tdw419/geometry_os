; DESCRIPTION: Draws a red rectangle at (288, 91) with width 23 and height 92.
; PLAN: r0=288(x), r1=91(y), r2=23(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 91
LDI r2, 23
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
