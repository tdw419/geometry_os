; DESCRIPTION: Composite: Renders a white line between points (392, 209) and (306, 71) then Places a yellow circle of radius 61 at center (195, 90) then Places a white dot at position (441, 91).
; PLAN: r0=392(x1), r1=209(y1), r2=306(x2), r3=71(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=195(x), r6=90(y), r7=61(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=441(x), r11=91(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 392
LDI r1, 209
LDI r2, 306
LDI r3, 71
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 195
LDI r6, 90
LDI r7, 61
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 441
LDI r11, 91
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
