; DESCRIPTION: Places a black line segment connecting (453, 182) to (295, 201).
; PLAN: r0=453(x1), r1=182(y1), r2=295(x2), r3=201(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 182
LDI r2, 295
LDI r3, 201
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
