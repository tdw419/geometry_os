; DESCRIPTION: Composite: Places a orange dot at position (145, 25) then Renders a red line between points (367, 44) and (434, 244).
; PLAN: r0=145(x), r1=25(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=367(x1), r6=44(y1), r7=434(x2), r8=244(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 145
LDI r1, 25
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 367
LDI r6, 44
LDI r7, 434
LDI r8, 244
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
