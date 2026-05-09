; DESCRIPTION: Draws a cyan rectangle at (248, 147) with width 103 and height 91.
; PLAN: r0=248(x), r1=147(y), r2=103(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 147
LDI r2, 103
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
