; DESCRIPTION: Draws a green rectangle at (93, 186) with width 95 and height 27.
; PLAN: r0=93(x), r1=186(y), r2=95(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 186
LDI r2, 95
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
