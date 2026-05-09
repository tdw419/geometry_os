; DESCRIPTION: Composite: Places a black dot at position (140, 53) then Draws a red line from (250, 176) to (60, 171).
; PLAN: r0=140(x), r1=53(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=250(x1), r6=176(y1), r7=60(x2), r8=171(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 140
LDI r1, 53
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 250
LDI r6, 176
LDI r7, 60
LDI r8, 171
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
