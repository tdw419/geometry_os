; DESCRIPTION: Composite: Places a purple dot at position (91, 246) then Places a black line segment connecting (504, 12) to (74, 241).
; PLAN: r0=91(x), r1=246(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=504(x1), r6=12(y1), r7=74(x2), r8=241(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 91
LDI r1, 246
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 504
LDI r6, 12
LDI r7, 74
LDI r8, 241
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
