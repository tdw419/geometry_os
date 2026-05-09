; DESCRIPTION: Composite: Sets a single orange pixel at (187, 242) then Draws a black line from (316, 104) to (234, 1).
; PLAN: r0=187(x), r1=242(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=316(x1), r6=104(y1), r7=234(x2), r8=1(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 187
LDI r1, 242
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 316
LDI r6, 104
LDI r7, 234
LDI r8, 1
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
