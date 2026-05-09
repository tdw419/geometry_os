; DESCRIPTION: Composite: Draws a green line from (491, 45) to (20, 176) then Sets a single cyan pixel at (382, 143).
; PLAN: r0=491(x1), r1=45(y1), r2=20(x2), r3=176(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=382(x), r6=143(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 491
LDI r1, 45
LDI r2, 20
LDI r3, 176
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 382
LDI r6, 143
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
