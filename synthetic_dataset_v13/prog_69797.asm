; DESCRIPTION: Draws a cyan rectangle at (323, 94) with width 65 and height 101.
; PLAN: r0=323(x), r1=94(y), r2=65(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 94
LDI r2, 65
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
