; DESCRIPTION: Composite: Creates a cyan circular shape at (370, 57) with radius 40 then Draws a green line from (3, 169) to (427, 70) then Places a black dot at position (177, 169).
; PLAN: r0=370(x), r1=57(y), r2=40(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=3(x1), r6=169(y1), r7=427(x2), r8=70(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=177(x), r11=169(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 370
LDI r1, 57
LDI r2, 40
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 3
LDI r6, 169
LDI r7, 427
LDI r8, 70
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 177
LDI r11, 169
LDI r12, 0x000000
PSET r10, r11, r12
HALT
