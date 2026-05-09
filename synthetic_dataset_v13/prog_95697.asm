; DESCRIPTION: Composite: Sets a single purple pixel at (421, 72) then Draws a magenta line from (87, 96) to (242, 145).
; PLAN: r0=421(x), r1=72(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=87(x1), r6=96(y1), r7=242(x2), r8=145(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 421
LDI r1, 72
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 87
LDI r6, 96
LDI r7, 242
LDI r8, 145
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
