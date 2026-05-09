; DESCRIPTION: Draws a cyan rectangle at (223, 134) with width 80 and height 110.
; PLAN: r0=223(x), r1=134(y), r2=80(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 134
LDI r2, 80
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
