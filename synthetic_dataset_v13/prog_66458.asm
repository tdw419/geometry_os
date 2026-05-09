; DESCRIPTION: Draws a cyan rectangle at (369, 105) with width 115 and height 89.
; PLAN: r0=369(x), r1=105(y), r2=115(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 105
LDI r2, 115
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
