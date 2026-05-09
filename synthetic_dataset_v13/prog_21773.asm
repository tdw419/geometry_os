; DESCRIPTION: Composite: Places a cyan dot at position (341, 145) then Draws a orange line from (139, 205) to (167, 133).
; PLAN: r0=341(x), r1=145(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=139(x1), r6=205(y1), r7=167(x2), r8=133(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 341
LDI r1, 145
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 139
LDI r6, 205
LDI r7, 167
LDI r8, 133
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
