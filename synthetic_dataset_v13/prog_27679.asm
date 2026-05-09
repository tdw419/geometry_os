; DESCRIPTION: Composite: Renders a cyan disk with center (363, 32) and radius 15 then Places a yellow line segment connecting (336, 102) to (259, 148) then Sets a single black pixel at (471, 249).
; PLAN: r0=363(x), r1=32(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=336(x1), r6=102(y1), r7=259(x2), r8=148(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=471(x), r11=249(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 363
LDI r1, 32
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 336
LDI r6, 102
LDI r7, 259
LDI r8, 148
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 471
LDI r11, 249
LDI r12, 0x000000
PSET r10, r11, r12
HALT
