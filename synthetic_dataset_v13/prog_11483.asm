; DESCRIPTION: Composite: Sets a single orange pixel at (303, 154) then Places a yellow line segment connecting (79, 250) to (382, 114).
; PLAN: r0=303(x), r1=154(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=79(x1), r6=250(y1), r7=382(x2), r8=114(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 303
LDI r1, 154
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 79
LDI r6, 250
LDI r7, 382
LDI r8, 114
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
