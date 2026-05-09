; DESCRIPTION: Composite: Places a black dot at position (113, 0) then Renders a white line between points (3, 39) and (483, 144).
; PLAN: r0=113(x), r1=0(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=3(x1), r6=39(y1), r7=483(x2), r8=144(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 113
LDI r1, 0
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 3
LDI r6, 39
LDI r7, 483
LDI r8, 144
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
