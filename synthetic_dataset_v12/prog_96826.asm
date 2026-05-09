; DESCRIPTION: Draws a red rectangle at (218, 110) with width 20 and height 49.
; PLAN: r0=218(x), r1=110(y), r2=20(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 110
LDI r2, 20
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
