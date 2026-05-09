; DESCRIPTION: Draws a cyan rectangle at (147, 136) with width 30 and height 119.
; PLAN: r0=147(x), r1=136(y), r2=30(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 136
LDI r2, 30
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
