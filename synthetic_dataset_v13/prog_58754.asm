; DESCRIPTION: Composite: Sets a single red pixel at (449, 57) then Draws a yellow line from (371, 25) to (9, 17).
; PLAN: r0=449(x), r1=57(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=371(x1), r6=25(y1), r7=9(x2), r8=17(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 449
LDI r1, 57
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 371
LDI r6, 25
LDI r7, 9
LDI r8, 17
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
