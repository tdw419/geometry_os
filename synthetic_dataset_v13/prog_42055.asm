; DESCRIPTION: Composite: Sets a single blue pixel at (352, 222) then Draws a black line from (30, 0) to (91, 4).
; PLAN: r0=352(x), r1=222(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=30(x1), r6=0(y1), r7=91(x2), r8=4(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 352
LDI r1, 222
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 30
LDI r6, 0
LDI r7, 91
LDI r8, 4
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
