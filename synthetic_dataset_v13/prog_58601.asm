; DESCRIPTION: Draws a cyan rectangle at (91, 147) with width 93 and height 31.
; PLAN: r0=91(x), r1=147(y), r2=93(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 147
LDI r2, 93
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
