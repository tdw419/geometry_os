; DESCRIPTION: Composite: Places a black line segment connecting (304, 226) to (274, 2) then Sets a single black pixel at (11, 154).
; PLAN: r0=304(x1), r1=226(y1), r2=274(x2), r3=2(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=11(x), r6=154(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 304
LDI r1, 226
LDI r2, 274
LDI r3, 2
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 11
LDI r6, 154
LDI r7, 0x000000
PSET r5, r6, r7
HALT
