; DESCRIPTION: Draws a cyan rectangle at (147, 226) with width 117 and height 29.
; PLAN: r0=147(x), r1=226(y), r2=117(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 226
LDI r2, 117
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
