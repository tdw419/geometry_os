; DESCRIPTION: Draws a cyan rectangle at (34, 147) with width 110 and height 49.
; PLAN: r0=34(x), r1=147(y), r2=110(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 147
LDI r2, 110
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
