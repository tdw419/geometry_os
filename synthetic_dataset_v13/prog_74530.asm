; DESCRIPTION: Composite: Places a cyan dot at position (131, 222) then Places a black line segment connecting (112, 135) to (227, 235).
; PLAN: r0=131(x), r1=222(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=112(x1), r6=135(y1), r7=227(x2), r8=235(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 131
LDI r1, 222
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 112
LDI r6, 135
LDI r7, 227
LDI r8, 235
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
