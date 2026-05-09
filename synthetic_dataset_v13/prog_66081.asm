; DESCRIPTION: Composite: Places a cyan dot at position (191, 147) then Places a black line segment connecting (171, 25) to (376, 65).
; PLAN: r0=191(x), r1=147(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=171(x1), r6=25(y1), r7=376(x2), r8=65(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 191
LDI r1, 147
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 171
LDI r6, 25
LDI r7, 376
LDI r8, 65
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
