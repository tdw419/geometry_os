; DESCRIPTION: Draws a red rectangle at (200, 169) with width 96 and height 82.
; PLAN: r0=200(x), r1=169(y), r2=96(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 169
LDI r2, 96
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
