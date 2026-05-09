; DESCRIPTION: Draws a cyan rectangle at (275, 20) with width 118 and height 112.
; PLAN: r0=275(x), r1=20(y), r2=118(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 20
LDI r2, 118
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
