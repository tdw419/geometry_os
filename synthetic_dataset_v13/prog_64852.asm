; DESCRIPTION: Composite: Renders a cyan line between points (314, 129) and (350, 212) then Sets a single red pixel at (162, 30).
; PLAN: r0=314(x1), r1=129(y1), r2=350(x2), r3=212(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=162(x), r6=30(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 314
LDI r1, 129
LDI r2, 350
LDI r3, 212
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 162
LDI r6, 30
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
