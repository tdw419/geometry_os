; DESCRIPTION: Composite: Renders a red line between points (145, 42) and (44, 192) then Places a yellow dot at position (76, 188).
; PLAN: r0=145(x1), r1=42(y1), r2=44(x2), r3=192(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=76(x), r6=188(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 145
LDI r1, 42
LDI r2, 44
LDI r3, 192
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 76
LDI r6, 188
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
