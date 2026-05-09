; DESCRIPTION: Composite: Places a yellow line segment connecting (40, 242) to (20, 252) then Sets a single red pixel at (188, 115).
; PLAN: r0=40(x1), r1=242(y1), r2=20(x2), r3=252(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=188(x), r6=115(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 40
LDI r1, 242
LDI r2, 20
LDI r3, 252
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 188
LDI r6, 115
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
