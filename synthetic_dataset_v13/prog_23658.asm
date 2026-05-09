; DESCRIPTION: Composite: Sets a single blue pixel at (495, 148) then Draws a white line from (445, 235) to (147, 60).
; PLAN: r0=495(x), r1=148(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=445(x1), r6=235(y1), r7=147(x2), r8=60(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 495
LDI r1, 148
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 445
LDI r6, 235
LDI r7, 147
LDI r8, 60
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
