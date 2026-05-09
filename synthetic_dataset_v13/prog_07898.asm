; DESCRIPTION: Composite: Places a white dot at position (475, 198) then Places a yellow line segment connecting (279, 97) to (315, 41).
; PLAN: r0=475(x), r1=198(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=279(x1), r6=97(y1), r7=315(x2), r8=41(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 475
LDI r1, 198
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 279
LDI r6, 97
LDI r7, 315
LDI r8, 41
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
