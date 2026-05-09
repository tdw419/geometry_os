; DESCRIPTION: Composite: Sets a single purple pixel at (37, 193) then Places a yellow line segment connecting (170, 21) to (2, 177).
; PLAN: r0=37(x), r1=193(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=170(x1), r6=21(y1), r7=2(x2), r8=177(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 37
LDI r1, 193
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 170
LDI r6, 21
LDI r7, 2
LDI r8, 177
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
