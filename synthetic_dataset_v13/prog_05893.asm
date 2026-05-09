; DESCRIPTION: Composite: Renders a cyan disk with center (180, 96) and radius 62 then Places a green line segment connecting (391, 147) to (43, 237) then Sets a single yellow pixel at (359, 41).
; PLAN: r0=180(x), r1=96(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=391(x1), r6=147(y1), r7=43(x2), r8=237(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=359(x), r11=41(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 180
LDI r1, 96
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 391
LDI r6, 147
LDI r7, 43
LDI r8, 237
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 359
LDI r11, 41
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
