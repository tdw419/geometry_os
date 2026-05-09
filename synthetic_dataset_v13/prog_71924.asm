; DESCRIPTION: Composite: Renders a cyan disk with center (395, 150) and radius 63 then Sets a single cyan pixel at (355, 1) then Renders a green line between points (258, 47) and (362, 254).
; PLAN: r0=395(x), r1=150(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=355(x), r6=1(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=258(x1), r11=47(y1), r12=362(x2), r13=254(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 395
LDI r1, 150
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 355
LDI r6, 1
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 258
LDI r11, 47
LDI r12, 362
LDI r13, 254
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
