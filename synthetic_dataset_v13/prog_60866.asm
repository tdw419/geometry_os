; DESCRIPTION: Composite: Places a white line segment connecting (86, 2) to (369, 165) then Places a red dot at position (199, 173).
; PLAN: r0=86(x1), r1=2(y1), r2=369(x2), r3=165(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=199(x), r6=173(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 86
LDI r1, 2
LDI r2, 369
LDI r3, 165
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 199
LDI r6, 173
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
