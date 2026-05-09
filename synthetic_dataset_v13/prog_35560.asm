; DESCRIPTION: Composite: Places a red line segment connecting (204, 165) to (493, 37) then Places a purple dot at position (153, 217).
; PLAN: r0=204(x1), r1=165(y1), r2=493(x2), r3=37(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=153(x), r6=217(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 204
LDI r1, 165
LDI r2, 493
LDI r3, 37
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 153
LDI r6, 217
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
