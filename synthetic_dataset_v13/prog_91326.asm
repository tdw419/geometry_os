; DESCRIPTION: Draws a red rectangle at (17, 169) with width 95 and height 23.
; PLAN: r0=17(x), r1=169(y), r2=95(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 169
LDI r2, 95
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
