; DESCRIPTION: Draws a cyan rectangle at (357, 0) with width 73 and height 107.
; PLAN: r0=357(x), r1=0(y), r2=73(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 0
LDI r2, 73
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
