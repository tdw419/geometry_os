; DESCRIPTION: Composite: Places a green dot at position (503, 223) then Renders a yellow line between points (354, 172) and (378, 45).
; PLAN: r0=503(x), r1=223(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=354(x1), r6=172(y1), r7=378(x2), r8=45(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 503
LDI r1, 223
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 354
LDI r6, 172
LDI r7, 378
LDI r8, 45
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
