; DESCRIPTION: Composite: Renders a red disk with center (139, 177) and radius 52 then Places a red line segment connecting (32, 40) to (363, 203) then Sets a single black pixel at (101, 215).
; PLAN: r0=139(x), r1=177(y), r2=52(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=32(x1), r6=40(y1), r7=363(x2), r8=203(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=101(x), r11=215(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 139
LDI r1, 177
LDI r2, 52
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 32
LDI r6, 40
LDI r7, 363
LDI r8, 203
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 101
LDI r11, 215
LDI r12, 0x000000
PSET r10, r11, r12
HALT
