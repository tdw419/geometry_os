; DESCRIPTION: Draws a cyan rectangle at (36, 34) with width 118 and height 93.
; PLAN: r0=36(x), r1=34(y), r2=118(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 34
LDI r2, 118
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
