; DESCRIPTION: Composite: Sets a single green pixel at (128, 158) then Draws a red line from (1, 130) to (476, 10).
; PLAN: r0=128(x), r1=158(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=1(x1), r6=130(y1), r7=476(x2), r8=10(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 128
LDI r1, 158
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 1
LDI r6, 130
LDI r7, 476
LDI r8, 10
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
