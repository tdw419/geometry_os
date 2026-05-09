; DESCRIPTION: Composite: Places a black dot at position (330, 212) then Renders a white line between points (447, 110) and (375, 254).
; PLAN: r0=330(x), r1=212(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=447(x1), r6=110(y1), r7=375(x2), r8=254(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 330
LDI r1, 212
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 447
LDI r6, 110
LDI r7, 375
LDI r8, 254
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
