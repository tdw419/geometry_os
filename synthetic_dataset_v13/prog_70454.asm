; DESCRIPTION: Composite: Places a purple dot at position (477, 241) then Draws a blue line from (218, 85) to (207, 242).
; PLAN: r0=477(x), r1=241(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=218(x1), r6=85(y1), r7=207(x2), r8=242(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 477
LDI r1, 241
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 218
LDI r6, 85
LDI r7, 207
LDI r8, 242
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
