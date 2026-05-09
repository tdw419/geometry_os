; DESCRIPTION: Draws a red rectangle at (186, 135) with width 90 and height 110.
; PLAN: r0=186(x), r1=135(y), r2=90(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 135
LDI r2, 90
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
