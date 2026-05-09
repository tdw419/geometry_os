; DESCRIPTION: Draws a cyan rectangle at (341, 24) with width 96 and height 89.
; PLAN: r0=341(x), r1=24(y), r2=96(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 24
LDI r2, 96
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
