; DESCRIPTION: Composite: Sets a single red pixel at (248, 149) then Renders a green line between points (382, 209) and (114, 216).
; PLAN: r0=248(x), r1=149(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=382(x1), r6=209(y1), r7=114(x2), r8=216(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 248
LDI r1, 149
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 382
LDI r6, 209
LDI r7, 114
LDI r8, 216
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
