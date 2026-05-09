; DESCRIPTION: Draws a cyan rectangle at (357, 24) with width 105 and height 118.
; PLAN: r0=357(x), r1=24(y), r2=105(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 24
LDI r2, 105
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
