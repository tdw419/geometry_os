; DESCRIPTION: Composite: Sets a single orange pixel at (353, 82) then Draws a black line from (15, 31) to (385, 207).
; PLAN: r0=353(x), r1=82(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=15(x1), r6=31(y1), r7=385(x2), r8=207(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 353
LDI r1, 82
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 15
LDI r6, 31
LDI r7, 385
LDI r8, 207
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
