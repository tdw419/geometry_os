; DESCRIPTION: Composite: Renders a black line between points (482, 252) and (1, 68) then Sets a single white pixel at (495, 238).
; PLAN: r0=482(x1), r1=252(y1), r2=1(x2), r3=68(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=495(x), r6=238(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 482
LDI r1, 252
LDI r2, 1
LDI r3, 68
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 495
LDI r6, 238
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
