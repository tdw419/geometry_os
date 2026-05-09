; DESCRIPTION: Composite: Sets a single blue pixel at (75, 231) then Draws a yellow line from (109, 202) to (19, 64).
; PLAN: r0=75(x), r1=231(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=109(x1), r6=202(y1), r7=19(x2), r8=64(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 75
LDI r1, 231
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 109
LDI r6, 202
LDI r7, 19
LDI r8, 64
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
