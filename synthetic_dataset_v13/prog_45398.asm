; DESCRIPTION: Draws a orange rectangle at (92, 155) with width 110 and height 71.
; PLAN: r0=92(x), r1=155(y), r2=110(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 155
LDI r2, 110
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
