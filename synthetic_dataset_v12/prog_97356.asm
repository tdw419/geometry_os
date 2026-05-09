; DESCRIPTION: Draws a red rectangle at (295, 86) with width 106 and height 110.
; PLAN: r0=295(x), r1=86(y), r2=106(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 86
LDI r2, 106
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
