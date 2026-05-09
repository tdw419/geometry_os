; DESCRIPTION: Composite: Sets a single orange pixel at (288, 183) then Draws a cyan line from (314, 104) to (437, 174).
; PLAN: r0=288(x), r1=183(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=314(x1), r6=104(y1), r7=437(x2), r8=174(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 288
LDI r1, 183
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 314
LDI r6, 104
LDI r7, 437
LDI r8, 174
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
