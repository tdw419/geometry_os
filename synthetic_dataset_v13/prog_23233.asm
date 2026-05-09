; DESCRIPTION: Draws a red rectangle at (222, 17) with width 37 and height 99.
; PLAN: r0=222(x), r1=17(y), r2=37(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 17
LDI r2, 37
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
