; DESCRIPTION: Composite: Places a black dot at position (456, 112) then Draws a white line from (364, 30) to (372, 80).
; PLAN: r0=456(x), r1=112(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=364(x1), r6=30(y1), r7=372(x2), r8=80(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 456
LDI r1, 112
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 364
LDI r6, 30
LDI r7, 372
LDI r8, 80
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
