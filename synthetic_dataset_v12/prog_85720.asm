; DESCRIPTION: Composite: Places a white dot at position (80, 177) then Places a red line segment connecting (236, 102) to (431, 99).
; PLAN: r0=80(x), r1=177(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=236(x1), r6=102(y1), r7=431(x2), r8=99(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 80
LDI r1, 177
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 236
LDI r6, 102
LDI r7, 431
LDI r8, 99
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
