; DESCRIPTION: Composite: Places a red dot at position (341, 66) then Renders a white line between points (248, 188) and (16, 249).
; PLAN: r0=341(x), r1=66(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=248(x1), r6=188(y1), r7=16(x2), r8=249(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 341
LDI r1, 66
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 248
LDI r6, 188
LDI r7, 16
LDI r8, 249
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
