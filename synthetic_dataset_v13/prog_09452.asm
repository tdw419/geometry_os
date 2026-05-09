; DESCRIPTION: Composite: Draws a cyan line from (8, 163) to (199, 124) then Sets a single black pixel at (129, 60).
; PLAN: r0=8(x1), r1=163(y1), r2=199(x2), r3=124(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=129(x), r6=60(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 8
LDI r1, 163
LDI r2, 199
LDI r3, 124
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 129
LDI r6, 60
LDI r7, 0x000000
PSET r5, r6, r7
HALT
