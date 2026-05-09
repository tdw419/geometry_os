; DESCRIPTION: Composite: Renders a green line between points (465, 82) and (70, 53) then Places a cyan dot at position (391, 147).
; PLAN: r0=465(x1), r1=82(y1), r2=70(x2), r3=53(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=391(x), r6=147(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 465
LDI r1, 82
LDI r2, 70
LDI r3, 53
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 147
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
