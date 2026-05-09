; DESCRIPTION: Composite: Sets a single white pixel at (476, 109) then Renders a green line between points (350, 182) and (455, 162).
; PLAN: r0=476(x), r1=109(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=350(x1), r6=182(y1), r7=455(x2), r8=162(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 476
LDI r1, 109
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 350
LDI r6, 182
LDI r7, 455
LDI r8, 162
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
