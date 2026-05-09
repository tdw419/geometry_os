; DESCRIPTION: Draws a cyan rectangle at (89, 80) with width 72 and height 85.
; PLAN: r0=89(x), r1=80(y), r2=72(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 80
LDI r2, 72
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
