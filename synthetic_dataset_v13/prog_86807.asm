; DESCRIPTION: Composite: Places a cyan dot at position (42, 23) then Draws a orange line from (139, 177) to (237, 130).
; PLAN: r0=42(x), r1=23(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=139(x1), r6=177(y1), r7=237(x2), r8=130(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 42
LDI r1, 23
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 139
LDI r6, 177
LDI r7, 237
LDI r8, 130
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
