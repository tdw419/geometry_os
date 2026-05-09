; DESCRIPTION: Composite: Draws a cyan line from (137, 41) to (104, 46) then Sets a single orange pixel at (300, 64).
; PLAN: r0=137(x1), r1=41(y1), r2=104(x2), r3=46(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=300(x), r6=64(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 137
LDI r1, 41
LDI r2, 104
LDI r3, 46
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 64
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
