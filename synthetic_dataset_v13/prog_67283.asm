; DESCRIPTION: Composite: Draws a cyan circle centered at (454, 147) with radius 55 then Renders a red line between points (161, 231) and (37, 236) then Sets a single cyan pixel at (26, 251).
; PLAN: r0=454(x), r1=147(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=161(x1), r6=231(y1), r7=37(x2), r8=236(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=26(x), r11=251(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 454
LDI r1, 147
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 161
LDI r6, 231
LDI r7, 37
LDI r8, 236
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 26
LDI r11, 251
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
