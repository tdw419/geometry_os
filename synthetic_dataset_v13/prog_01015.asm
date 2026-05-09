; DESCRIPTION: Composite: Places a black dot at position (5, 190) then Renders a magenta line between points (231, 100) and (212, 54).
; PLAN: r0=5(x), r1=190(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=231(x1), r6=100(y1), r7=212(x2), r8=54(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 5
LDI r1, 190
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 231
LDI r6, 100
LDI r7, 212
LDI r8, 54
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
