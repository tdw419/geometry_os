; DESCRIPTION: Draws a cyan rectangle at (347, 142) with width 79 and height 110.
; PLAN: r0=347(x), r1=142(y), r2=79(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 142
LDI r2, 79
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
