; DESCRIPTION: Draws a red rectangle at (38, 108) with width 77 and height 110.
; PLAN: r0=38(x), r1=108(y), r2=77(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 108
LDI r2, 77
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
