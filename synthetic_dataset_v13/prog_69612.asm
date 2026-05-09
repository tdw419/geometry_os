; DESCRIPTION: Composite: Sets a single yellow pixel at (112, 146) then Renders a orange line between points (16, 157) and (432, 238).
; PLAN: r0=112(x), r1=146(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=16(x1), r6=157(y1), r7=432(x2), r8=238(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 112
LDI r1, 146
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 16
LDI r6, 157
LDI r7, 432
LDI r8, 238
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
