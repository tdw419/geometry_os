; DESCRIPTION: Composite: Draws a orange line from (186, 124) to (344, 44) then Sets a single black pixel at (189, 72).
; PLAN: r0=186(x1), r1=124(y1), r2=344(x2), r3=44(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=189(x), r6=72(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 186
LDI r1, 124
LDI r2, 344
LDI r3, 44
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 189
LDI r6, 72
LDI r7, 0x000000
PSET r5, r6, r7
HALT
