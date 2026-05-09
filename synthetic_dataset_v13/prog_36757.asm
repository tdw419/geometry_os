; DESCRIPTION: Composite: Draws a green line from (205, 240) to (434, 64) then Sets a single black pixel at (126, 182).
; PLAN: r0=205(x1), r1=240(y1), r2=434(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=126(x), r6=182(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 205
LDI r1, 240
LDI r2, 434
LDI r3, 64
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 182
LDI r7, 0x000000
PSET r5, r6, r7
HALT
