; DESCRIPTION: Composite: Places a green line segment connecting (201, 230) to (104, 194) then Places a black dot at position (23, 95).
; PLAN: r0=201(x1), r1=230(y1), r2=104(x2), r3=194(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=23(x), r6=95(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 201
LDI r1, 230
LDI r2, 104
LDI r3, 194
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 23
LDI r6, 95
LDI r7, 0x000000
PSET r5, r6, r7
HALT
