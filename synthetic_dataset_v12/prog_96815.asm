; DESCRIPTION: Composite: Places a black dot at position (4, 2) then Draws a purple line from (12, 101) to (229, 29).
; PLAN: r0=4(x), r1=2(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=12(x1), r6=101(y1), r7=229(x2), r8=29(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 4
LDI r1, 2
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 12
LDI r6, 101
LDI r7, 229
LDI r8, 29
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
