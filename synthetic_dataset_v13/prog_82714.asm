; DESCRIPTION: Composite: Sets a single blue pixel at (419, 18) then Renders a red line between points (101, 18) and (259, 46).
; PLAN: r0=419(x), r1=18(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=101(x1), r6=18(y1), r7=259(x2), r8=46(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 419
LDI r1, 18
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 101
LDI r6, 18
LDI r7, 259
LDI r8, 46
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
