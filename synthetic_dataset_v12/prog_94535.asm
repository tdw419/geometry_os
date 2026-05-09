; DESCRIPTION: Composite: Sets a single black pixel at (166, 114) then Draws a cyan line from (369, 56) to (197, 109).
; PLAN: r0=166(x), r1=114(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=369(x1), r6=56(y1), r7=197(x2), r8=109(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 166
LDI r1, 114
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 369
LDI r6, 56
LDI r7, 197
LDI r8, 109
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
