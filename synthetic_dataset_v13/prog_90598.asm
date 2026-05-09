; DESCRIPTION: Draws a red rectangle at (137, 133) with width 75 and height 38.
; PLAN: r0=137(x), r1=133(y), r2=75(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 133
LDI r2, 75
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
