; DESCRIPTION: Draws a orange rectangle at (92, 29) with width 72 and height 115.
; PLAN: r0=92(x), r1=29(y), r2=72(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 29
LDI r2, 72
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
