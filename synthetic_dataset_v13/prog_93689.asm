; DESCRIPTION: Composite: Places a red dot at position (364, 109) then Renders a yellow line between points (417, 243) and (421, 246).
; PLAN: r0=364(x), r1=109(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=417(x1), r6=243(y1), r7=421(x2), r8=246(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 364
LDI r1, 109
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 417
LDI r6, 243
LDI r7, 421
LDI r8, 246
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
