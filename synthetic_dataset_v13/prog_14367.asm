; DESCRIPTION: Composite: Places a red line segment connecting (188, 231) to (180, 144) then Places a cyan dot at position (378, 23).
; PLAN: r0=188(x1), r1=231(y1), r2=180(x2), r3=144(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=378(x), r6=23(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 188
LDI r1, 231
LDI r2, 180
LDI r3, 144
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 378
LDI r6, 23
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
