; DESCRIPTION: Composite: Sets a single green pixel at (412, 14) then Places a red line segment connecting (428, 200) to (245, 3).
; PLAN: r0=412(x), r1=14(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=428(x1), r6=200(y1), r7=245(x2), r8=3(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 412
LDI r1, 14
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 428
LDI r6, 200
LDI r7, 245
LDI r8, 3
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
