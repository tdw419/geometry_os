; DESCRIPTION: Composite: Places a orange dot at position (441, 245) then Renders a magenta line between points (66, 79) and (345, 54).
; PLAN: r0=441(x), r1=245(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=66(x1), r6=79(y1), r7=345(x2), r8=54(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 441
LDI r1, 245
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 66
LDI r6, 79
LDI r7, 345
LDI r8, 54
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
