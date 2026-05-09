; DESCRIPTION: Composite: Sets a single black pixel at (107, 175) then Draws a magenta line from (5, 124) to (247, 79).
; PLAN: r0=107(x), r1=175(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=5(x1), r6=124(y1), r7=247(x2), r8=79(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 107
LDI r1, 175
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 5
LDI r6, 124
LDI r7, 247
LDI r8, 79
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
