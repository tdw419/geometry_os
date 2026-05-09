; DESCRIPTION: Composite: Places a white dot at position (247, 205) then Renders a black line between points (79, 217) and (466, 127).
; PLAN: r0=247(x), r1=205(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=79(x1), r6=217(y1), r7=466(x2), r8=127(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 247
LDI r1, 205
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 79
LDI r6, 217
LDI r7, 466
LDI r8, 127
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
