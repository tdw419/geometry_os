; DESCRIPTION: Composite: Draws a white line from (266, 162) to (139, 1) then Places a yellow dot at position (376, 8).
; PLAN: r0=266(x1), r1=162(y1), r2=139(x2), r3=1(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=376(x), r6=8(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 266
LDI r1, 162
LDI r2, 139
LDI r3, 1
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 376
LDI r6, 8
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
