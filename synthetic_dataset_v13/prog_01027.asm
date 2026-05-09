; DESCRIPTION: Draws a cyan rectangle at (498, 134) with width 12 and height 77.
; PLAN: r0=498(x), r1=134(y), r2=12(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 134
LDI r2, 12
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
