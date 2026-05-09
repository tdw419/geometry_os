; DESCRIPTION: Composite: Renders a white line between points (188, 252) and (455, 6) then Sets a single black pixel at (23, 229).
; PLAN: r0=188(x1), r1=252(y1), r2=455(x2), r3=6(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=23(x), r6=229(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 188
LDI r1, 252
LDI r2, 455
LDI r3, 6
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 23
LDI r6, 229
LDI r7, 0x000000
PSET r5, r6, r7
HALT
