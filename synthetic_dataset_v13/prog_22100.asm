; DESCRIPTION: Draws a cyan rectangle at (303, 94) with width 89 and height 62.
; PLAN: r0=303(x), r1=94(y), r2=89(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 94
LDI r2, 89
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
