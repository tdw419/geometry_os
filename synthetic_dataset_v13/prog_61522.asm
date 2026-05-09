; DESCRIPTION: Draws a cyan rectangle at (357, 81) with width 33 and height 28.
; PLAN: r0=357(x), r1=81(y), r2=33(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 81
LDI r2, 33
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
