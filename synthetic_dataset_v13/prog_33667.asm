; DESCRIPTION: Composite: Renders a cyan line between points (445, 99) and (33, 160) then Sets a single white pixel at (66, 201).
; PLAN: r0=445(x1), r1=99(y1), r2=33(x2), r3=160(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=66(x), r6=201(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 445
LDI r1, 99
LDI r2, 33
LDI r3, 160
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 66
LDI r6, 201
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
