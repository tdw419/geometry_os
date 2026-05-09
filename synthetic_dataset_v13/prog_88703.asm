; DESCRIPTION: Composite: Sets a single cyan pixel at (302, 56) then Renders a cyan line between points (422, 147) and (35, 16).
; PLAN: r0=302(x), r1=56(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=422(x1), r6=147(y1), r7=35(x2), r8=16(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 302
LDI r1, 56
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 422
LDI r6, 147
LDI r7, 35
LDI r8, 16
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
