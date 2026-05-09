; DESCRIPTION: Composite: Sets a single red pixel at (405, 126) then Draws a white line from (449, 181) to (15, 48).
; PLAN: r0=405(x), r1=126(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=449(x1), r6=181(y1), r7=15(x2), r8=48(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 405
LDI r1, 126
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 449
LDI r6, 181
LDI r7, 15
LDI r8, 48
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
