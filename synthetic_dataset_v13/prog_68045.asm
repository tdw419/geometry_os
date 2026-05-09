; DESCRIPTION: Composite: Renders a cyan box of size 74x49 starting at (378, 60) then Renders a green line between points (0, 158) and (483, 73).
; PLAN: r0=378(x), r1=60(y), r2=74(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=0(x1), r6=158(y1), r7=483(x2), r8=73(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 378
LDI r1, 60
LDI r2, 74
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 0
LDI r6, 158
LDI r7, 483
LDI r8, 73
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
