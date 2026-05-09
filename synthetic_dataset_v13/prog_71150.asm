; DESCRIPTION: Composite: Places a red line segment connecting (271, 16) to (201, 143) then Sets a single yellow pixel at (138, 172).
; PLAN: r0=271(x1), r1=16(y1), r2=201(x2), r3=143(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=138(x), r6=172(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 271
LDI r1, 16
LDI r2, 201
LDI r3, 143
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 138
LDI r6, 172
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
