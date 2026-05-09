; DESCRIPTION: Draws a cyan rectangle at (287, 81) with width 89 and height 23.
; PLAN: r0=287(x), r1=81(y), r2=89(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 81
LDI r2, 89
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
