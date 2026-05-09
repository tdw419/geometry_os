; DESCRIPTION: Composite: Creates a cyan circular shape at (95, 138) with radius 35 then Places a red line segment connecting (31, 241) to (399, 120) then Sets a single blue pixel at (147, 46).
; PLAN: r0=95(x), r1=138(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=31(x1), r6=241(y1), r7=399(x2), r8=120(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=147(x), r11=46(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 95
LDI r1, 138
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 31
LDI r6, 241
LDI r7, 399
LDI r8, 120
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 147
LDI r11, 46
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
