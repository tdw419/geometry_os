; DESCRIPTION: Composite: Draws a red line from (367, 76) to (290, 84) then Places a yellow dot at position (439, 124).
; PLAN: r0=367(x1), r1=76(y1), r2=290(x2), r3=84(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=439(x), r6=124(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 367
LDI r1, 76
LDI r2, 290
LDI r3, 84
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 124
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
