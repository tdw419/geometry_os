; DESCRIPTION: Draws a cyan rectangle at (147, 195) with width 28 and height 37.
; PLAN: r0=147(x), r1=195(y), r2=28(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 195
LDI r2, 28
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
