; DESCRIPTION: Composite: Places a red dot at position (367, 137) then Renders a yellow line between points (162, 79) and (221, 188).
; PLAN: r0=367(x), r1=137(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=162(x1), r6=79(y1), r7=221(x2), r8=188(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 367
LDI r1, 137
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 162
LDI r6, 79
LDI r7, 221
LDI r8, 188
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
