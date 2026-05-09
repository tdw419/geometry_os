; DESCRIPTION: Composite: Places a red line segment connecting (14, 165) to (388, 180) then Creates a red circular shape at (314, 165) with radius 74 then Sets a single cyan pixel at (256, 241).
; PLAN: r0=14(x1), r1=165(y1), r2=388(x2), r3=180(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=314(x), r6=165(y), r7=74(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=256(x), r11=241(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 14
LDI r1, 165
LDI r2, 388
LDI r3, 180
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 314
LDI r6, 165
LDI r7, 74
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 256
LDI r11, 241
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
