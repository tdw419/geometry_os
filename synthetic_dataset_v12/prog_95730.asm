; DESCRIPTION: Composite: Renders a green line between points (34, 107) and (226, 4) then Places a cyan dot at position (149, 150).
; PLAN: r0=34(x1), r1=107(y1), r2=226(x2), r3=4(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=149(x), r6=150(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 34
LDI r1, 107
LDI r2, 226
LDI r3, 4
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 149
LDI r6, 150
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
