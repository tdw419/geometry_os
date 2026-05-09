; DESCRIPTION: Composite: Places a yellow line segment connecting (250, 9) to (415, 147) then Places a cyan dot at position (478, 217).
; PLAN: r0=250(x1), r1=9(y1), r2=415(x2), r3=147(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=478(x), r6=217(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 250
LDI r1, 9
LDI r2, 415
LDI r3, 147
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 478
LDI r6, 217
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
