; DESCRIPTION: Composite: Sets a single black pixel at (260, 154) then Renders a green line between points (257, 161) and (189, 137).
; PLAN: r0=260(x), r1=154(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=257(x1), r6=161(y1), r7=189(x2), r8=137(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 260
LDI r1, 154
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 257
LDI r6, 161
LDI r7, 189
LDI r8, 137
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
