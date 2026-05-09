; DESCRIPTION: Composite: Places a red dot at position (247, 61) then Draws a white line from (309, 192) to (107, 79).
; PLAN: r0=247(x), r1=61(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=309(x1), r6=192(y1), r7=107(x2), r8=79(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 247
LDI r1, 61
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 309
LDI r6, 192
LDI r7, 107
LDI r8, 79
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
