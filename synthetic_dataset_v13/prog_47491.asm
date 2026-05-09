; DESCRIPTION: Composite: Draws a green circle centered at (158, 74) with radius 38 then Draws a red line from (432, 45) to (273, 120) then Sets a single white pixel at (149, 48).
; PLAN: r0=158(x), r1=74(y), r2=38(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=432(x1), r6=45(y1), r7=273(x2), r8=120(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=149(x), r11=48(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 158
LDI r1, 74
LDI r2, 38
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 432
LDI r6, 45
LDI r7, 273
LDI r8, 120
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 149
LDI r11, 48
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
