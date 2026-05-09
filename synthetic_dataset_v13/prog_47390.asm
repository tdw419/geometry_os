; DESCRIPTION: Composite: Places a blue line segment connecting (453, 2) to (100, 49) then Places a blue dot at position (276, 64).
; PLAN: r0=453(x1), r1=2(y1), r2=100(x2), r3=49(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=276(x), r6=64(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 453
LDI r1, 2
LDI r2, 100
LDI r3, 49
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 276
LDI r6, 64
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
