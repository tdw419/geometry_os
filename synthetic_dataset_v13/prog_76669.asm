; DESCRIPTION: Composite: Renders a red line between points (130, 249) and (57, 186) then Places a red dot at position (120, 185).
; PLAN: r0=130(x1), r1=249(y1), r2=57(x2), r3=186(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=120(x), r6=185(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 130
LDI r1, 249
LDI r2, 57
LDI r3, 186
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 120
LDI r6, 185
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
