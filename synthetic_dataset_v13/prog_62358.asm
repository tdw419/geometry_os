; DESCRIPTION: Draws a cyan rectangle at (45, 85) with width 89 and height 70.
; PLAN: r0=45(x), r1=85(y), r2=89(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 85
LDI r2, 89
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
