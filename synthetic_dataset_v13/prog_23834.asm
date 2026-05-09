; DESCRIPTION: Draws a cyan rectangle at (199, 80) with width 40 and height 112.
; PLAN: r0=199(x), r1=80(y), r2=40(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 80
LDI r2, 40
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
