; DESCRIPTION: Composite: Places a magenta dot at position (284, 93) then Renders a black line between points (417, 2) and (486, 13).
; PLAN: r0=284(x), r1=93(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=417(x1), r6=2(y1), r7=486(x2), r8=13(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 284
LDI r1, 93
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 417
LDI r6, 2
LDI r7, 486
LDI r8, 13
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
