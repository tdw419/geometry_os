; DESCRIPTION: Composite: Sets a single purple pixel at (394, 213) then Renders a red line between points (508, 223) and (259, 108).
; PLAN: r0=394(x), r1=213(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=508(x1), r6=223(y1), r7=259(x2), r8=108(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 394
LDI r1, 213
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 508
LDI r6, 223
LDI r7, 259
LDI r8, 108
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
