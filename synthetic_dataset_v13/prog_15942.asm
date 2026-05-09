; DESCRIPTION: Draws a cyan rectangle at (297, 100) with width 52 and height 112.
; PLAN: r0=297(x), r1=100(y), r2=52(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 100
LDI r2, 52
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
