; DESCRIPTION: Composite: Places a yellow dot at position (323, 238) then Places a magenta line segment connecting (300, 77) to (288, 106).
; PLAN: r0=323(x), r1=238(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=300(x1), r6=77(y1), r7=288(x2), r8=106(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 323
LDI r1, 238
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 300
LDI r6, 77
LDI r7, 288
LDI r8, 106
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
