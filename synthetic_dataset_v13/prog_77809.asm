; DESCRIPTION: Composite: Sets a single magenta pixel at (52, 73) then Creates a yellow rectangular region at (484, 167) spanning 10 by 68 pixels.
; PLAN: r0=52(x), r1=73(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=484(x), r6=167(y), r7=10(width), r8=68(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 52
LDI r1, 73
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 484
LDI r6, 167
LDI r7, 10
LDI r8, 68
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
