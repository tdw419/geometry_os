; DESCRIPTION: Composite: Draws a red line from (85, 129) to (126, 230) then Sets a single red pixel at (128, 55).
; PLAN: r0=85(x1), r1=129(y1), r2=126(x2), r3=230(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=128(x), r6=55(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 85
LDI r1, 129
LDI r2, 126
LDI r3, 230
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 128
LDI r6, 55
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
