; DESCRIPTION: Composite: Draws a purple line from (280, 236) to (389, 45) then Sets a single cyan pixel at (298, 94).
; PLAN: r0=280(x1), r1=236(y1), r2=389(x2), r3=45(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=298(x), r6=94(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 280
LDI r1, 236
LDI r2, 389
LDI r3, 45
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 298
LDI r6, 94
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
