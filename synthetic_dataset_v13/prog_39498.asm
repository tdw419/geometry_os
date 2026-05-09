; DESCRIPTION: Draws a red rectangle at (76, 77) with width 38 and height 90.
; PLAN: r0=76(x), r1=77(y), r2=38(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 77
LDI r2, 38
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
