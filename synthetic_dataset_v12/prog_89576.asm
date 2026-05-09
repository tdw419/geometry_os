; DESCRIPTION: Draws a red rectangle at (87, 110) with width 73 and height 72.
; PLAN: r0=87(x), r1=110(y), r2=73(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 110
LDI r2, 73
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
