; DESCRIPTION: Composite: Sets a single black pixel at (23, 147) then Renders a white line between points (62, 0) and (368, 83).
; PLAN: r0=23(x), r1=147(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=62(x1), r6=0(y1), r7=368(x2), r8=83(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 23
LDI r1, 147
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 62
LDI r6, 0
LDI r7, 368
LDI r8, 83
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
