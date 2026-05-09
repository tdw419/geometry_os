; DESCRIPTION: Composite: Places a red dot at position (356, 93) then Places a purple line segment connecting (453, 51) to (64, 115).
; PLAN: r0=356(x), r1=93(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=453(x1), r6=51(y1), r7=64(x2), r8=115(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 356
LDI r1, 93
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 453
LDI r6, 51
LDI r7, 64
LDI r8, 115
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
