; DESCRIPTION: Composite: Sets a single orange pixel at (427, 149) then Renders a purple line between points (141, 173) and (45, 242).
; PLAN: r0=427(x), r1=149(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=141(x1), r6=173(y1), r7=45(x2), r8=242(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 427
LDI r1, 149
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 141
LDI r6, 173
LDI r7, 45
LDI r8, 242
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
