; DESCRIPTION: Draws a cyan rectangle at (109, 61) with width 110 and height 112.
; PLAN: r0=109(x), r1=61(y), r2=110(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 61
LDI r2, 110
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
