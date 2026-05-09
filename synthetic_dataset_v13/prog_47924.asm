; DESCRIPTION: Composite: Draws a magenta line from (208, 98) to (84, 176) then Sets a single orange pixel at (21, 202).
; PLAN: r0=208(x1), r1=98(y1), r2=84(x2), r3=176(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=21(x), r6=202(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 208
LDI r1, 98
LDI r2, 84
LDI r3, 176
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 21
LDI r6, 202
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
