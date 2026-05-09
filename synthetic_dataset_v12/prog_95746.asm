; DESCRIPTION: Composite: Places a black dot at position (336, 84) then Places a green line segment connecting (412, 235) to (359, 137).
; PLAN: r0=336(x), r1=84(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=412(x1), r6=235(y1), r7=359(x2), r8=137(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 336
LDI r1, 84
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 412
LDI r6, 235
LDI r7, 359
LDI r8, 137
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
