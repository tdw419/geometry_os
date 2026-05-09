; DESCRIPTION: Composite: Sets a single blue pixel at (72, 107) then Draws a orange line from (235, 207) to (242, 112).
; PLAN: r0=72(x), r1=107(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=235(x1), r6=207(y1), r7=242(x2), r8=112(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 72
LDI r1, 107
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 235
LDI r6, 207
LDI r7, 242
LDI r8, 112
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
