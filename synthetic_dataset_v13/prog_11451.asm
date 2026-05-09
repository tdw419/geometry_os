; DESCRIPTION: Composite: Places a cyan dot at position (201, 223) then Places a red line segment connecting (433, 129) to (4, 35).
; PLAN: r0=201(x), r1=223(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=433(x1), r6=129(y1), r7=4(x2), r8=35(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 201
LDI r1, 223
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 433
LDI r6, 129
LDI r7, 4
LDI r8, 35
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
