; DESCRIPTION: Composite: Places a cyan circle of radius 49 at center (414, 126) then Renders a cyan line between points (165, 201) and (138, 241).
; PLAN: r0=414(x), r1=126(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=165(x1), r6=201(y1), r7=138(x2), r8=241(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 414
LDI r1, 126
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 165
LDI r6, 201
LDI r7, 138
LDI r8, 241
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
