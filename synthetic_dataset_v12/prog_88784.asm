; DESCRIPTION: Composite: Draws a black line from (32, 176) to (212, 101) then Sets a single cyan pixel at (51, 14).
; PLAN: r0=32(x1), r1=176(y1), r2=212(x2), r3=101(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=51(x), r6=14(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 32
LDI r1, 176
LDI r2, 212
LDI r3, 101
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 51
LDI r6, 14
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
