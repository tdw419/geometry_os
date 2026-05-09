; DESCRIPTION: Draws a cyan rectangle at (106, 6) with width 89 and height 39.
; PLAN: r0=106(x), r1=6(y), r2=89(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 6
LDI r2, 89
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
