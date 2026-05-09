; DESCRIPTION: Composite: Places a magenta dot at position (44, 29) then Draws a red line from (241, 28) to (260, 169).
; PLAN: r0=44(x), r1=29(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=241(x1), r6=28(y1), r7=260(x2), r8=169(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 44
LDI r1, 29
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 241
LDI r6, 28
LDI r7, 260
LDI r8, 169
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
