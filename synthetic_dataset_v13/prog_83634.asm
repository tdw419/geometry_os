; DESCRIPTION: Composite: Sets a single black pixel at (1, 88) then Places a white line segment connecting (96, 101) to (40, 51).
; PLAN: r0=1(x), r1=88(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=96(x1), r6=101(y1), r7=40(x2), r8=51(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 1
LDI r1, 88
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 96
LDI r6, 101
LDI r7, 40
LDI r8, 51
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
