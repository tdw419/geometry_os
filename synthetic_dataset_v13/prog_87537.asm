; DESCRIPTION: Draws a yellow rectangle at (295, 118) with width 49 and height 51.
; PLAN: r0=295(x), r1=118(y), r2=49(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 118
LDI r2, 49
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
