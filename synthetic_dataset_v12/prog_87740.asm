; DESCRIPTION: Composite: Draws a red line from (9, 44) to (477, 44) then Places a yellow dot at position (503, 17).
; PLAN: r0=9(x1), r1=44(y1), r2=477(x2), r3=44(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=503(x), r6=17(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 9
LDI r1, 44
LDI r2, 477
LDI r3, 44
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 503
LDI r6, 17
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
