; DESCRIPTION: Composite: Draws a red rectangle at (222, 42) with width 106 and height 66 then Sets a single yellow pixel at (432, 216).
; PLAN: r0=222(x), r1=42(y), r2=106(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=432(x), r6=216(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 222
LDI r1, 42
LDI r2, 106
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 432
LDI r6, 216
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
