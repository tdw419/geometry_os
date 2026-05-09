; DESCRIPTION: Draws a cyan rectangle at (161, 200) with width 89 and height 40.
; PLAN: r0=161(x), r1=200(y), r2=89(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 200
LDI r2, 89
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
