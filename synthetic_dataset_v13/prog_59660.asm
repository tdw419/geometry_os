; DESCRIPTION: Composite: Renders a cyan line between points (43, 108) and (468, 12) then Sets a single black pixel at (442, 143).
; PLAN: r0=43(x1), r1=108(y1), r2=468(x2), r3=12(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=442(x), r6=143(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 43
LDI r1, 108
LDI r2, 468
LDI r3, 12
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 143
LDI r7, 0x000000
PSET r5, r6, r7
HALT
