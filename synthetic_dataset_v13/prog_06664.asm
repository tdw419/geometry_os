; DESCRIPTION: Composite: Places a black line segment connecting (380, 115) to (309, 209) then Places a red dot at position (9, 126) then Renders a yellow disk with center (272, 144) and radius 47.
; PLAN: r0=380(x1), r1=115(y1), r2=309(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=9(x), r6=126(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=272(x), r11=144(y), r12=47(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 380
LDI r1, 115
LDI r2, 309
LDI r3, 209
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 9
LDI r6, 126
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 272
LDI r11, 144
LDI r12, 47
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
