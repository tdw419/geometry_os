; DESCRIPTION: Composite: Draws a orange line from (448, 126) to (407, 2) then Sets a single cyan pixel at (493, 138).
; PLAN: r0=448(x1), r1=126(y1), r2=407(x2), r3=2(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=493(x), r6=138(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 448
LDI r1, 126
LDI r2, 407
LDI r3, 2
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 493
LDI r6, 138
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
