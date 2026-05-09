; DESCRIPTION: Composite: Renders a orange line between points (96, 2) and (116, 167) then Sets a single black pixel at (510, 65).
; PLAN: r0=96(x1), r1=2(y1), r2=116(x2), r3=167(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=510(x), r6=65(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 96
LDI r1, 2
LDI r2, 116
LDI r3, 167
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 510
LDI r6, 65
LDI r7, 0x000000
PSET r5, r6, r7
HALT
