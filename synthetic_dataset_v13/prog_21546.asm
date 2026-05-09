; DESCRIPTION: Draws a cyan rectangle at (147, 81) with width 48 and height 93.
; PLAN: r0=147(x), r1=81(y), r2=48(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 81
LDI r2, 48
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
