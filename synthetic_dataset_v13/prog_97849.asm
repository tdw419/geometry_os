; DESCRIPTION: Draws a cyan rectangle at (343, 160) with width 116 and height 37.
; PLAN: r0=343(x), r1=160(y), r2=116(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 160
LDI r2, 116
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
