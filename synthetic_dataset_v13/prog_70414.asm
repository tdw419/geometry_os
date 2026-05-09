; DESCRIPTION: Composite: Places a yellow dot at position (424, 124) then Renders a yellow line between points (85, 212) and (164, 224).
; PLAN: r0=424(x), r1=124(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=85(x1), r6=212(y1), r7=164(x2), r8=224(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 424
LDI r1, 124
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 85
LDI r6, 212
LDI r7, 164
LDI r8, 224
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
