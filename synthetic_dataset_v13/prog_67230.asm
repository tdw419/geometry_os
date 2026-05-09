; DESCRIPTION: Draws a cyan rectangle at (448, 89) with width 35 and height 41.
; PLAN: r0=448(x), r1=89(y), r2=35(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 89
LDI r2, 35
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
