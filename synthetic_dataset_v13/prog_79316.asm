; DESCRIPTION: Composite: Places a red circle of radius 28 at center (273, 143) then Places a green line segment connecting (32, 211) to (130, 249) then Sets a single black pixel at (131, 187).
; PLAN: r0=273(x), r1=143(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=32(x1), r6=211(y1), r7=130(x2), r8=249(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=131(x), r11=187(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 273
LDI r1, 143
LDI r2, 28
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 32
LDI r6, 211
LDI r7, 130
LDI r8, 249
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 131
LDI r11, 187
LDI r12, 0x000000
PSET r10, r11, r12
HALT
