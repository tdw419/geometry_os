; DESCRIPTION: Draws a orange rectangle at (215, 89) with width 57 and height 110.
; PLAN: r0=215(x), r1=89(y), r2=57(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 89
LDI r2, 57
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
