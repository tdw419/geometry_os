; DESCRIPTION: Draws a cyan rectangle at (94, 81) with width 89 and height 80.
; PLAN: r0=94(x), r1=81(y), r2=89(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 81
LDI r2, 89
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
